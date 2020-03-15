import 'package:assets_audio_player_example/AppPages/LibrariesPage/ArtistsList/artistgrid.dart';
import 'package:assets_audio_player_example/modules/artist.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';
import '../searchbar.dart';
import '../toprow.dart';

class ArtistsList extends StatefulWidget {
  @override
  _ArtistsListState createState() => _ArtistsListState();
}

class _ArtistsListState extends State<ArtistsList> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
        initialScrollOffset: SizeConfig.blockSizeVertical * 12);
  }

  @override
  Widget build(BuildContext context) {
    SearchBar _searchBar = SearchBar();

    TopRow _topRow = TopRow();

    ArtistGrid _artistGrid = ArtistGrid(
      items: [
        Artist(artistName: "B-Doge", songsCount: 53),
        Artist(artistName: "B-Doge", songsCount: 53),
        Artist(artistName: "B-Doge", songsCount: 53),
        Artist(artistName: "B-Doge", songsCount: 53),
        Artist(artistName: "B-Doge", songsCount: 53),
        Artist(artistName: "B-Doge", songsCount: 53),
        Artist(artistName: "B-Doge", songsCount: 53),
        Artist(artistName: "B-Doge", songsCount: 53),
        Artist(artistName: "B-Doge", songsCount: 53),

      ],
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
}
