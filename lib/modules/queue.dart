import 'dart:async';
import 'package:ansicolor/ansicolor.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/library.dart';
import 'package:cadenza/modules/playlist.dart';
import 'package:cadenza/modules/song.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

enum PlayerState { PLAYING, PAUSED, STOPPED, LOADING }
enum RepeatState { NONE, ONCE, LOOP }

class Queue extends ChangeNotifier {
  final String recommenderURL;

  AudioPlayer player;

  Duration duration;
  Duration position;
  Stream<Duration> positionStream;
  PlayerState state = PlayerState.STOPPED;
  // imlplemented one explicitly
  // AudioPlayerState _audioPlayerState;

  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  // StreamSubscription _playerStateSubscription;

  Library library;
  List<Song> queue = [];
  Song currentSong;
  int currentSongIndex;
  bool _shuffle;
  bool doneRepeatOnce;
  RepeatState _repeat;
  bool _waitingForURL = false;
  String _waitingSongID;
  Queue({this.recommenderURL, this.library});

  void set shuffle(bool shuffling) {
    this._shuffle = shuffling;
    notifyListeners();
  }

  bool get shuffle => this._shuffle;

  void set repeat(RepeatState state) {
    this._repeat = state;
    notifyListeners();
  }

  RepeatState get repeat => this._repeat;

  void initializeQueue() {
    duration = Duration(microseconds: 0);
    position = Duration(microseconds: 0);

    _initAudioPlayer();

    _repeat = RepeatState.NONE;
    doneRepeatOnce = true;
    _shuffle = true;
  }

  void disposePlayer() {
    player.release();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    // _playerStateSubscription?.cancel();
  }

  @override
  void dispose() {
    disposePlayer();
    super.dispose();
  }

  void _initAudioPlayer() {
    AudioPlayer.logEnabled = false;
    player = AudioPlayer(playerId: "onlyplayer");
    player.setReleaseMode(ReleaseMode.STOP);

    _durationSubscription =
        player.onDurationChanged.distinct().listen((duration) {
      this.duration = duration;
      notifyListeners();
      // _durationSubscription.pause();
    });
    positionStream = player.onAudioPositionChanged;
    _positionSubscription = player.onAudioPositionChanged.listen((p) {
      this.position = p;
    });

    _playerCompleteSubscription = player.onPlayerCompletion.listen((event) {
      if (_repeat == RepeatState.LOOP) {
        player.stop();
        player.resume();
        return;
      }
      if (!nextSong()) clearQueue();
    });

    _playerErrorSubscription =
        player.onPlayerError.listen((msg) => print('audioPlayer error : $msg'));

    // player.onPlayerStateChanged.listen((state) => _audioPlayerState = state);
  }

  @deprecated
  void buildAlbumQueue(Album album, Song songZero) {
    queue = album.albumSongs;
    if (_shuffle) queue.shuffle();
    queue.remove(songZero);
    queue.insert(0, songZero);
    currentSong = queue[0];
    currentSongIndex = 0;
    playCurrentSong();
    notifyListeners();
  }

  @deprecated
  void buildPlaylistQueue(Playlist playlist, Song songZero) {
    queue = playlist.playlistSongs;
    if (_shuffle) queue.shuffle();
    queue.remove(songZero);
    queue.insert(0, songZero);
    currentSong = queue[0];
    currentSongIndex = 0;
    playCurrentSong();
    notifyListeners();
  }

  @deprecated
  void buildArtistQueue(Artist artist) {
    for (Album album in artist.albumsList) {
      queue.addAll(album.albumSongs);
    }
    if (_shuffle) queue.shuffle();
    notifyListeners();
  }

  void buildFromList(List<Song> songs, [Song songZero]) {
    if (songZero != null) {
      queue = songs;
      if (_shuffle) queue.shuffle();
      queue.remove(songZero);
      queue.insert(0, songZero);
      currentSong = queue[0];
      currentSongIndex = 0;
      playCurrentSong();
      notifyListeners();
    } else {
      queue = songs;
      if (_shuffle) queue.shuffle();
      currentSong = queue[0];
      currentSongIndex = 0;
      playCurrentSong();
      notifyListeners();
    }
    prepareQueue(0);
  }

  void buildFromLibrary() {
    queue = library.songs;
    if (_shuffle) queue.shuffle();
    notifyListeners();
  }

  void playSingleSong(Song song) async {
    if (!song.urlReady)
      song.getActualURL().then((url) {
        print("url is $url");
        player.play(url);
        print("playing song");
      });
    else
      print("shouldn't print");
  }

  void testBuild(List<Song> testingList) {
    queue = testingList;
    currentSong = queue[0];
    currentSongIndex = 0;
    player.play(currentSong.url, isLocal: false);
    state = PlayerState.PLAYING;
  }

  void prepareQueue(int startAt) {
    for (int i = startAt; i < 20; i++) {
      if(i==queue.length)
        return;
      Song song = queue[i];
      if (!(song.urlReady) && !(song.gettingURL)) {
        AnsiPen pen = AnsiPen()..rgb(r: 0, g: 1.0, b: 0);
         print(pen("getting url for${song.name}"));
        song.gettingURL = true;
        song.getActualURL().then((url) {
          song.actualURL = url;
          song.urlReady = true;
          song.gettingURL = false;
          if (_waitingForURL && (_waitingSongID == song.songID)) {
            playCurrentSong();
            _waitingForURL = false;
          }
        });
      }
    }
  }

  void playMoreLikeThis(Song song) {
    //TODO:implement when recommender server is up
    notifyListeners();
  }

  void addSong(Song song) {
    queue.insert(0, song);
    notifyListeners();
  }

  void removeSong(Song song) {
    queue.remove(song);
    notifyListeners();
  }

  bool nextSong() {
    if (!doneRepeatOnce) {
      doneRepeatOnce = true;
      _repeat = RepeatState.NONE;
    }
    if (currentSongIndex < (queue.length - 1)) {
      player.resume();
      player.stop();
      currentSongIndex++;
      currentSong = queue[currentSongIndex];
      playCurrentSong();
      if(currentSongIndex%20==0)
        prepareQueue(currentSongIndex);
      return true;
    }
    notifyListeners();
    return false;
  }

  bool previousSong() {
    if (currentSongIndex > 0) {
      player.resume();
      player.stop();
      currentSongIndex--;
      currentSong = queue[currentSongIndex];
      playCurrentSong();
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  void repeatOnce(bool repeat) {
    if (repeat) {
      queue.insert(1, currentSong);
      doneRepeatOnce = false;
    } else
      queue.removeAt(1);
  }

  void pauseCurrentSong() {
    state = PlayerState.PAUSED;
    player.pause();
    notifyListeners();
  }

  void resumeCurrentSong() {
    player.resume();
    state = PlayerState.PLAYING;
    notifyListeners();
  }

  void playCurrentSong() {
    if (!currentSong.urlReady) {
      this.state = PlayerState.LOADING;
      this.duration = Duration(milliseconds: 0);
      if (currentSong.gettingURL) {
        AnsiPen pen = AnsiPen()..rgb(r: 0, g: 0, b: 1.0);
        print(pen("waiting for url ${currentSong.name}"));
        _waitingForURL = true;
        _waitingSongID = currentSong.songID;
      } 
      else{
        currentSong.gettingURL = true;
        currentSong.getActualURL().then((url) {
          AnsiPen pen = AnsiPen()..rgb(r: 1.0, g: 0, b: 0);
          print(pen("getting url for ${currentSong.name}"));
          currentSong.urlReady = true;
          currentSong.gettingURL = false;
          currentSong.actualURL=url;
          player.setUrl(url);
          player.resume();
          state = PlayerState.PLAYING;
          this.notifyListeners();
        });
      }
    } else {
      AnsiPen pen = AnsiPen()..rgb(r: 1.0, g: 0, b: 0.1);
      print(pen("url is ready"));
      player.setUrl(currentSong.actualURL);
      player.resume();
      state = PlayerState.PLAYING;
      notifyListeners();
    }
  }

  void clearQueue() {
    queue.clear();
    player.release();
    notifyListeners();
  }
}
