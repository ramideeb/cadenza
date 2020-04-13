import 'package:cadenza/AppPages/LibrariesPage/MainList/libraypage.dart';
import 'package:flutter/material.dart';

import 'AlbumsList/albumslist.dart';
import 'ArtistsList/artistslist.dart';
import 'GenresList/genreslist.dart';
import 'SongsList/songslist.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  pageChangeCallback(String s) {
    setState(() {
      currentPage = s;
    });
  }

  String currentPage = "main";

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> _pages = {
      "songs": SongsList(
        changePage: pageChangeCallback,
      ),
      "albums": AlbumsList(changePage: pageChangeCallback),
      "genres": GenresList(changePage: pageChangeCallback),
      "artists": ArtistsList(
        changePage: pageChangeCallback,
      ),
      "main": LibraryPage(
        changePage: pageChangeCallback,
      ),
    };

    print(currentPage);
    return _pages[currentPage];
  }
}
