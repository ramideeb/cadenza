import 'package:assets_audio_player_example/modules/song.dart';

class Playlist{
  final String playlistId;
  final String name;
  final String description;
  final String imageUrl;
  
  List<Song> playlistSongs;

  Playlist({this.playlistId, this.name, this.description, this.imageUrl});


}