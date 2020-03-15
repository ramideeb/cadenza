import 'package:assets_audio_player_example/AppPages/LibrariesPage/GenresList/genresgrid.dart';
import 'package:assets_audio_player_example/AppPages/LibrariesPage/searchbar.dart';
import 'package:assets_audio_player_example/AppPages/LibrariesPage/toprow.dart';
import 'package:assets_audio_player_example/modules/genre.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

final List<Genre> genreExamples = [
  Genre(
    genreName: "Jazz",
    genreImageUrl: "assets/GenresImages/jazz.png",
  ),
  Genre(
    genreName: "Pop",
    genreImageUrl: "assets/GenresImages/pop2.jpg",
  ),
  Genre(
    genreName: "Classic",
    genreImageUrl: "assets/GenresImages/classical.jpg",
  ),
  Genre(
    genreName: "Rock and Roll",
    genreImageUrl: "assets/GenresImages/rock.jpg",
  ),
  Genre(
    genreName: "Alt",
    genreImageUrl: "assets/GenresImages/alt.jpg",
  ),
  Genre(
    genreName: "Country",
    genreImageUrl: "assets/GenresImages/country.jpg",
  ),
  Genre(
    genreName: "Blues",
    genreImageUrl: "assets/GenresImages/blues.jpg",
  ),
  Genre(
    genreName: "Jazz",
    genreImageUrl: "assets/GenresImages/jazz.png",
  ),
  Genre(
    genreName: "Pop",
    genreImageUrl: "assets/GenresImages/pop2.jpg",
  ),
  Genre(
    genreName: "Classic",
    genreImageUrl: "assets/GenresImages/classical.jpg",
  ),
  Genre(
    genreName: "Rock and Roll",
    genreImageUrl: "assets/GenresImages/rock.jpg",
  ),
  Genre(
    genreName: "Alt",
    genreImageUrl: "assets/GenresImages/alt.jpg",
  ),
  Genre(
    genreName: "Country",
    genreImageUrl: "assets/GenresImages/country.jpg",
  ),
  Genre(
    genreName: "Blues",
    genreImageUrl: "assets/GenresImages/blues.jpg",
  ),
];

class GenresList extends StatefulWidget {
  final Function changePage;

  const GenresList({Key key, this.changePage}) : super(key: key);
  @override
  _GenresListState createState() => _GenresListState();
}

class _GenresListState extends State<GenresList> {
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

    GenresGrid _grid = GenresGrid(
      items: genreExamples,
    );

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
