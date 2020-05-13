import 'package:cadenza/modules/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Playlist{
  String playlistId;
  String playlistName;
  String description;
  String imageUrl;
  bool isSnippet = false;
  DocumentReference playlistRef;
  List<Song> playlistSongs =[];

  Playlist({this.playlistId, this.playlistName, this.description, this.imageUrl});

  List<Map<String,dynamic>> toMap(){
    return playlistSongs.map((song) {
      return
        {
          "playlistId": playlistId,
          "songID": song.songID,
          "PlaylistName":playlistName,
          "description": description,
          "imageUrl":imageUrl,
        };
    }).toList();
  }


}