import 'package:cadenza/AppPages/LibrariesPage/GenresList/genresgrid.dart';
import 'package:cadenza/AppPages/LibrariesPage/searchbar.dart';
import 'package:cadenza/AppPages/LibrariesPage/toprow.dart';
import 'package:cadenza/modules/genre.dart';
import 'package:cadenza/modules/library.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  String pattern = "";
  searchThroughGenres(String pattern) {
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
    bool genresReady = Provider.of<Library>(context, listen: false).genresReady;
    if (genresReady) {
      SearchBar _searchBar = SearchBar(
        search: searchThroughGenres,
      );

      TopRow _topRow = TopRow(
        goBack: goBack,
      );

      GenresGrid _grid = GenresGrid(
        items: Provider.of<Library>(context).genres.where((g)=>g.genreName.contains(pattern)).toList(),
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
    return FutureBuilder(
      future: Provider.of<Library>(context, listen: false).fetchGenres(),
      builder: (con, finishedFetching) {
        if (finishedFetching.connectionState == ConnectionState.waiting ||
            finishedFetching.hasError)
          return Center(child: CircularProgressIndicator());
        else {
          SearchBar _searchBar = SearchBar(
            search: searchThroughGenres,
          );

          TopRow _topRow = TopRow(
            goBack: goBack,
          );

          GenresGrid _grid = GenresGrid(
            items: Provider.of<Library>(context).genres.where((g)=>g.genreName.contains(pattern)).toList(),
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
      },
    );
  }
}
