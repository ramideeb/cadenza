import 'package:cadenza/AppPages/LibrariesPage/SongsList/songgrid.dart';
import 'package:cadenza/AppPages/LibrariesPage/searchbar.dart';
import 'package:cadenza/AppPages/LibrariesPage/toprow.dart';
import 'package:cadenza/SizeConfig.dart';
import 'package:cadenza/modules/song.dart';
import 'package:flutter/material.dart';

class SongsList extends StatefulWidget {
  final Function(String) changePage;

  const SongsList({Key key, this.changePage}) : super(key: key);
  @override
  _SongsListState createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
        initialScrollOffset: SizeConfig.blockSizeVertical * 12);
  }

  goBack() {
    widget.changePage("main");
  }

  @override
  Widget build(BuildContext context) {
    TopRow _topRow = TopRow(
      goBack: goBack,
    );

    SongsGrid _list = SongsGrid(
      items: [
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
        Song(name: "We'll meet again", artistName: "Vera Lynn"),
      ],
    );

    SearchBar _searchBar = SearchBar();

    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        _searchBar,
        SliverToBoxAdapter(child: _topRow),
        _list,
      ],
    );
  }
}
