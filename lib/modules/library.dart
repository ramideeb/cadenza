import 'package:assets_audio_player_example/modules/Album.dart';
import 'package:assets_audio_player_example/modules/artist.dart';
import 'package:assets_audio_player_example/modules/genre.dart';
import 'package:assets_audio_player_example/modules/playlist.dart';
import 'package:assets_audio_player_example/modules/song.dart';
import 'package:assets_audio_player_example/modules/user.dart';
import 'package:flutter/cupertino.dart';

class Library extends ChangeNotifier{
  final User user;
  List<Song> songs;
  List<Album> albums;
  List<Playlist> playlists;
  List<Genre> genres;
  List<Artist> artists;

  Library({this.user});
  //TODO:to be implemented
}