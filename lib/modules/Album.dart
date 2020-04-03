import 'package:assets_audio_player_example/modules/song.dart';

class Album{
  final String albumName;
  final String artistName;
  final String albumArtImageUrl;
  List<Song> albumSongs;
  Album({this.albumName, this.artistName, this.albumArtImageUrl});

}