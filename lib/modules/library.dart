import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/genre.dart';
import 'package:cadenza/modules/playlist.dart';
import 'package:cadenza/modules/song.dart';
import 'package:cadenza/modules/user.dart';
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