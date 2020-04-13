import 'package:cadenza/modules/song.dart';

class Album {
  final String albumID;
  final String albumName;
  final String artistName;
  final String albumArtImageUrl;
  List<Song> albumSongs;

  Album({
    this.albumID,
    this.albumName,
    this.artistName,
    this.albumArtImageUrl,
  }){
    this.albumSongs = new List<Song>();
  }
}
