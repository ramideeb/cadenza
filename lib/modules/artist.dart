import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/song.dart';
import 'package:cadenza/modules/user.dart';

class Artist extends User{
  //TODO: change count to function when connected to database;
  final songsCount;
  List<Album> albumsList;
  List<Song> songsList;

  Artist({String uid,this.songsCount}) : super(uid:uid);
  

}