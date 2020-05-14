import 'package:cadenza/AppPages/LibrariesPage/SongsList/songgrid.dart';
import 'package:cadenza/AppPages/LibrariesPage/searchbar.dart';
import 'package:cadenza/AppPages/LibrariesPage/toprow.dart';
import 'package:cadenza/SizeConfig.dart';
import 'package:cadenza/modules/library.dart';
import 'package:cadenza/modules/song.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SongsList extends StatefulWidget {
  final Function(String) changePage;
  final Function(Song, BuildContext) playLibrarySongs;
  const SongsList({Key key, this.changePage, this.playLibrarySongs})
      : super(key: key);
  @override
  _SongsListState createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  ScrollController _scrollController;
  String pattern = "";
  searchThroughSongs(String pattern) {
    setState(() {
      this.pattern = pattern;
    });
  }

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
      items: Provider.of<Library>(context)
          .songs
          .where((s) => s.name.contains(pattern))
          .toList(),
      playLibrarySongs: widget.playLibrarySongs,
    );

    SearchBar _searchBar = SearchBar(
      search: searchThroughSongs,
    );

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
