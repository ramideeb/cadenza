import 'package:assets_audio_player_example/modules/Album.dart';
import 'package:assets_audio_player_example/modules/song.dart';
import 'package:assets_audio_player_example/modules/user.dart';

class Artist extends User{
  //TODO: change count to function when connected to database;
  final songsCount;
  List<Album> albumsList;
  List<Song> songsList;

  Artist({String username,this.songsCount}) : super(username);
  

}