import 'package:cadenza/modules/song.dart';

import 'artist.dart';

class Album {
  final String albumID;
  final String albumName;
  final Artist artist;
  final String albumArtImageUrl;
  List<Song> albumSongs;

  Album({
    this.artist,
    this.albumID,
    this.albumName,
    this.albumArtImageUrl,
  }){
    this.albumSongs = new List<Song>();
  }

  List<Map<String,dynamic>> toMap(){
    return albumSongs.map((song) {
      return
      {
        "albumID": albumID,
        "songID": song.songID,
        "albumName":albumName,
        "artist": artist.uid,
        "albumArtImageUrl":albumArtImageUrl,
      };
    }).toList();
  }


}
