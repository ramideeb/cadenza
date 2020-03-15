import 'package:assets_audio_player_example/AppPages/LibrariesPage/SongsList/songgrid.dart';
import 'package:assets_audio_player_example/AppPages/LibrariesPage/searchbar.dart';
import 'package:assets_audio_player_example/AppPages/LibrariesPage/toprow.dart';
import 'package:assets_audio_player_example/SizeConfig.dart';
import 'package:assets_audio_player_example/modules/song.dart';
import 'package:flutter/material.dart';

class SongsList extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {

    TopRow _topRow = TopRow();

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
