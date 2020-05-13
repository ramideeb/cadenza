import 'package:cadenza/AppPages/LibrariesPage/MainList/libraypage.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/playlist.dart';
import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/modules/song.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AlbumsList/albumslist.dart';
import 'ArtistsList/artistslist.dart';
import 'GenresList/genreslist.dart';
import 'SongsList/songslist.dart';

class Library extends StatefulWidget {
  final Function(Album) showAlbum;
  final Function(Playlist) showPlaylist;
  const Library({Key key, this.showAlbum, this.showPlaylist}) : super(key: key);
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  pageChangeCallback(String s) {
    setState(() {
      currentPage = s;
    });
  }

  playFromLibrary(Song song, BuildContext context) {
    Provider.of<Queue>(context, listen: false).buildFromLibrary(song);
  }

  String currentPage = "main";

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> _pages = {
      "songs": SongsList(
        changePage: pageChangeCallback,
        playLibrarySongs: playFromLibrary,
      ),
      "albums": AlbumsList(
        changePage: pageChangeCallback,
        showAlbum: widget.showAlbum,
      ),
      "genres": GenresList(changePage: pageChangeCallback),
      "artists": ArtistsList(
        changePage: pageChangeCallback,
      ),
      "main": LibraryPage(
        changePage: pageChangeCallback,
        showPlaylist: widget.showPlaylist,
      ),
    };

    return _pages[currentPage];
  }
}
