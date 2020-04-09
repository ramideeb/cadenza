import 'package:cadenza/modules/song.dart';

class Playlist{
  final String playlistId;
  final String name;
  final String description;
  final String imageUrl;
  
  List<Song> playlistSongs;

  Playlist({this.playlistId, this.name, this.description, this.imageUrl});


}