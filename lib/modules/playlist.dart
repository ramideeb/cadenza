import 'package:cadenza/modules/song.dart';

class Playlist{
  final String playlistId;
  final String PlaylistName;
  final String description;
  final String imageUrl;
  
  List<Song> playlistSongs;

  Playlist({this.playlistId, this.PlaylistName, this.description, this.imageUrl});

  List<Map<String,dynamic>> toMap(){
    return playlistSongs.map((song) {
      return
        {
          "playlistId": playlistId,
          "songID": song.songID,
          "PlaylistName":PlaylistName,
          "description": description,
          "imageUrl":imageUrl,
        };
    }).toList();
  }


}