import 'package:cadenza/modules/song.dart';

class Album{
  final String albumName;
  final String artistName;
  final String albumArtImageUrl;
  List<Song> albumSongs;
  Album({this.albumName, this.artistName, this.albumArtImageUrl});

}