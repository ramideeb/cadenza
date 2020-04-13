import 'package:cadenza/AppPages/LibrariesPage/ArtistsList/artistgrid.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
        initialScrollOffset: SizeConfig.blockSizeVertical * 12);
  }
   goBack(){
    widget.changePage("main");
  }

  @override
  Widget build(BuildContext context) {
    SearchBar _searchBar = SearchBar();

    TopRow _topRow = TopRow(goBack: goBack);

    ArtistGrid _artistGrid = ArtistGrid(
      items: [
        Artist(uid: "B-Doge", songsCount: 53),
        Artist(uid: "B-Doge", songsCount: 53),
        Artist(uid: "B-Doge", songsCount: 53),
        Artist(uid: "B-Doge", songsCount: 53),
        Artist(uid: "B-Doge", songsCount: 53),
        Artist(uid: "B-Doge", songsCount: 53),
        Artist(uid: "B-Doge", songsCount: 53),
        Artist(uid: "B-Doge", songsCount: 53),
        Artist(uid: "B-Doge", songsCount: 53),

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
