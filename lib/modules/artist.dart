import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/song.dart';
import 'package:cadenza/modules/user.dart';

import 'DatabaseController.dart';

class Artist extends User {
  //TODO: change count to function when connected to database;
  final songsCount;

  //TODO: replace it with getArtistAlbum()
  List<Album> albumsList;

//  List<Song> songsList;

//  Artist({String username,String uid,this.songsCount}) : super(uid:uid,username:username);
  Artist({String username, String uid, this.songsCount}) : super(uid);

  Map<String, dynamic> toMap() {
    return {
      "uid": super.uid,
      "username": username,
    };
  }

  Future<List<Album>> getArtistAlbum() async {
    return await DatabaseController.getAlbum(artist: this);
  }
}
