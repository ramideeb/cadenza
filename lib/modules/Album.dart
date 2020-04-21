import 'package:cadenza/modules/DatabaseController.dart';
import 'package:cadenza/modules/genre.dart';
import 'package:cadenza/modules/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'artist.dart';

class Album {
  final String albumID;
  String albumName;
  String artistName;
  DocumentReference artistRef;
  Artist artist;
  String albumArtImageUrl;
  String genreName;
  Genre genre;
  //TODO: replace it with function get albums songs  getAlbumSongs()
  List<Song> albumSongs;

  Album({
    this.artist,
    this.artistName,
    this.artistRef,
    this.albumID,
    this.albumName,
    this.albumArtImageUrl,
    this.genreName,
    this.genre,
  });
  
  Map<String, dynamic> toMap() {
    return {
      "albumID": albumID,
      "albumName":albumName,
      "artist": artist.uid,
      "albumArtImageUrl":albumArtImageUrl,
    };
  }

  Future<List<OfflineSong>> getAlbumSongs()async{
    return await DatabaseController.getOfflineSong(albumID: this.albumID);
  }


}
