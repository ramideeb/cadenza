import 'package:cadenza/AppPages/LibrariesPage/AlbumsList/albumsgrid.dart';
import 'package:cadenza/AppPages/LibrariesPage/searchbar.dart';
import 'package:cadenza/AppPages/LibrariesPage/toprow.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/library.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../SizeConfig.dart';

final List<Album> albumExamples = [
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art2.jpg",
    artist: Artist(username: "Shosmo"),
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art3.jpg",
    artist: Artist(username: "Shosmo"),
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art6.jpg",
    artist: Artist(username: "Shosmo"),
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art5.jpg",
    artist: Artist(username: "Shosmo"),
  ),
];

class AlbumsList extends StatefulWidget {
  final Function changePage;
  final Function(Album) showAlbum;
  const AlbumsList({Key key, this.changePage, this.showAlbum})
      : super(key: key);
  @override
  _AlbumsListState createState() => _AlbumsListState();
}

class _AlbumsListState extends State<AlbumsList> {
  ScrollController _scrollController;
  String pattern = "";
  searchThroughAlbums(String pattern) {
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
    bool albumsReady = Provider.of<Library>(context, listen: false).albumsReady;
    if (albumsReady) {
      SearchBar _searchBar = SearchBar(
        search: searchThroughAlbums,
      );

      TopRow _topRow = TopRow(
        goBack: goBack,
      );

      List<Album> albums = Provider.of<Library>(context).albums.where((a)=>a.albumName.contains(pattern)).toList();
      AlbumsGrid _grid = AlbumsGrid(items: albums,showAlbum: widget.showAlbum,);

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

      future: Provider.of<Library>(context, listen: false).fetchAlbums(),
      builder: (context, finishedFetching) {
        if (finishedFetching.connectionState == ConnectionState.waiting ||
            finishedFetching.hasError)
          return Center(child: CircularProgressIndicator());
        else {
          SearchBar _searchBar = SearchBar(
            search: searchThroughAlbums,
          );

          TopRow _topRow = TopRow(
            goBack: goBack,
          );

          List<Album> albums = Provider.of<Library>(context).albums.where((a)=>a.albumName.contains(pattern)).toList();

          AlbumsGrid _grid = AlbumsGrid(items: albums,showAlbum: widget.showAlbum,);

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
