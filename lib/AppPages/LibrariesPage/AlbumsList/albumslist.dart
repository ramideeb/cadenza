import 'package:cadenza/AppPages/LibrariesPage/AlbumsList/albumsgrid.dart';
import 'package:cadenza/AppPages/LibrariesPage/searchbar.dart';
import 'package:cadenza/AppPages/LibrariesPage/toprow.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

final List<Album> albumExamples = [
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art2.jpg",
    artistName: "Shosmo",
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art3.jpg",
    artistName: "Shosmo",
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art6.jpg",
    artistName: "Shosmo",
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art5.jpg",
    artistName: "Shosmo",
  ),
];

class AlbumsList extends StatefulWidget {
  final Function changePage;

  const AlbumsList({Key key, this.changePage}) : super(key: key);
  @override
  _AlbumsListState createState() => _AlbumsListState();
}

class _AlbumsListState extends State<AlbumsList> {
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
    SearchBar _searchBar = SearchBar();

    TopRow _topRow = TopRow(
      goBack: goBack,
    );

    AlbumsGrid _grid = AlbumsGrid(items: albumExamples + albumExamples);

    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        _searchBar,
        SliverToBoxAdapter(child: _topRow),
        _grid,
      ],
    );
  }
}
