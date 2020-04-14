import 'package:cadenza/modules/DatabaseController.dart';
import 'package:cadenza/modules/song.dart';
import 'artist.dart';

class Album {
  final String albumID;
  final String albumName;
  final Artist artist;
  final String albumArtImageUrl;

  //TODO: replace it with function get albums songs  getAlbumSongs()
  List<Song> albumSongs;

  Album({
    this.artist,
    this.albumID,
    this.albumName,
    this.albumArtImageUrl,
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
