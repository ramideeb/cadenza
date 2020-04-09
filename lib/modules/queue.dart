import 'dart:async';
import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/library.dart';
import 'package:cadenza/modules/playlist.dart';
import 'package:cadenza/modules/song.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

enum PlayerState { PLAYING, PAUSED, STOPPED }
enum RepeatState { NONE, ONCE, LOOP }

class Queue extends ChangeNotifier {
  
  final String recommenderURL;  
  
  AudioPlayer player;

  Duration duration;
  Duration position;

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
  bool shuffle;
  bool doneRepeatOnce;
  RepeatState repeat;

  Queue({this.recommenderURL, this.library}) {
    duration = Duration(microseconds: 0);
    position = Duration(microseconds: 0);

    _initAudioPlayer();
    
    repeat = RepeatState.NONE;
    doneRepeatOnce = true;
    shuffle = true;

  }

  @override
  void dispose() {
    player.release();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    // _playerStateSubscription?.cancel();
    super.dispose();
  }

  void _initAudioPlayer() {
    player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.STOP);

    _durationSubscription = player.onDurationChanged.listen((duration) {
      this.duration = duration;
      _durationSubscription.pause();
    });

    _positionSubscription = player.onAudioPositionChanged.listen((p) {
      this.position = p;
      notifyListeners();
    });

    _playerCompleteSubscription = player.onPlayerCompletion.listen((event) {
      if (repeat == RepeatState.LOOP) {
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

  void buildAlbumQueue(Album album) {
    queue = album.albumSongs;
    if (shuffle) queue.shuffle();
    notifyListeners();
  }

  void buildPlaylistQueue(Playlist playlist) {
    queue = playlist.playlistSongs;
    if (shuffle) queue.shuffle();
    notifyListeners();
  }

  void buildArtistQueue(Artist artist) {
    for (Album album in artist.albumsList) {
      queue.addAll(album.albumSongs);
    }
    if (shuffle) queue.shuffle();
    notifyListeners();
  }

  void testBuild(List<Song> testingList) {
    queue = testingList;
    currentSong = queue[0];
    currentSongIndex = 0;
    player.play(currentSong.url, isLocal: false);
    state = PlayerState.PLAYING;
  }

  void playMoreLikeThis(Song song) {
    //TODO:implement when recommender server is up
    notifyListeners();
  }

  void buildFromLibrary() {
    queue = library.songs;
    if (shuffle) queue.shuffle();
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
    if(!doneRepeatOnce){
      doneRepeatOnce = true;
      repeat = RepeatState.NONE;
    }
    if (currentSongIndex < (queue.length - 1)) {
      player.resume();
      player.stop();
      currentSongIndex++;
      currentSong = queue[currentSongIndex];
      player.setUrl(currentSong.url);
      playCurrentSong();
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
      player.play(currentSong.url);
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  void repeatOnce(bool repeat){
    if(repeat){
    queue.insert(1, currentSong);
    doneRepeatOnce = false;
    }
    else
      queue.removeAt(1);
  }

  void pauseCurrentSong() {
    state = PlayerState.PAUSED;
    player.pause();
    notifyListeners();
  }

  void playCurrentSong() {
    player.resume();
    state = PlayerState.PLAYING;
    notifyListeners();
  }

  void clearQueue() {
    queue.clear();
    player.release();
    notifyListeners();
  }
}
