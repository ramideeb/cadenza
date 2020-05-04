import 'package:cadenza/AppPages/LibrariesPage/ArtistsList/artistgrid.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/library.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../SizeConfig.dart';
import '../searchbar.dart';
import '../toprow.dart';

class ArtistsList extends StatefulWidget {
  final Function changePage;

  const ArtistsList({Key key, this.changePage}) : super(key: key);
  @override
  _ArtistsListState createState() => _ArtistsListState();
}

class _ArtistsListState extends State<ArtistsList> {
  ScrollController _scrollController;
  String pattern = "";
  searchThroughArtists(String pattern) {
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
    bool artistsReady =
        Provider.of<Library>(context, listen: false).artistsReady;
    if (artistsReady) {
      SearchBar _searchBar = SearchBar(
        search: searchThroughArtists,
      );

      TopRow _topRow = TopRow(goBack: goBack);

      ArtistGrid _artistGrid = ArtistGrid(
        items: Provider.of<Library>(context).artists.where((a)=>a.username.contains(pattern)).toList(),
      );

      return CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          _searchBar,
          SliverToBoxAdapter(child: _topRow),
          _artistGrid,
        ],
      );
    }
    return FutureBuilder(
      future: Provider.of<Library>(context, listen: false).fetchArtists(),
      builder: (context, finishedFetching) {
        if (finishedFetching.connectionState == ConnectionState.waiting ||
            finishedFetching.hasError)
          return Center(child: CircularProgressIndicator());
        else {
          SearchBar _searchBar = SearchBar(
            search: searchThroughArtists,
          );

          TopRow _topRow = TopRow(goBack: goBack);

          ArtistGrid _artistGrid = ArtistGrid(
            items: Provider.of<Library>(context).artists.where((a)=>a.username.contains(pattern)).toList(),
          );

          return CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              _searchBar,
              SliverToBoxAdapter(child: _topRow),
              _artistGrid,
            ],
          );
        }
      },
    );
  }
}
