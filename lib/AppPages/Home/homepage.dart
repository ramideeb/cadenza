import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/AppPages/Home/genresrow.dart';
import 'package:cadenza/AppPages/Home/musicgrid.dart';
import 'package:cadenza/AppPages/Home/musicrow.dart';
import 'package:cadenza/AppPages/PublicWidgets/circularArtistView.dart';
import 'package:cadenza/SizeConfig.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/genre.dart';
import 'package:flutter/material.dart';
// import 'genreswidget.dart';

final List<Album> albumExamples = [
  Album(
    artist: Artist(
      uid: "ddd",
    ),
    albumName: "fff",
    albumID: "12222",
    albumArtImageUrl: "assets/AlbumImages/art1.jpg",
  ),
  Album(
    artist: Artist(
      uid: "ddd",
    ),
    albumName: "fff",
    albumID: "12222",
    albumArtImageUrl: "assets/AlbumImages/art1.jpg",
  ),
//  Album(
//    albumName: "Album",
//    albumArtImageUrl: "assets/AlbumImages/art2.jpg",
//    artistName: "Shosmo",
//  ),
//  Album(
//    albumName: "Album",
//    albumArtImageUrl: "assets/AlbumImages/art3.jpg",
//    artistName: "Shosmo",
//  ),
//  Album(
//    albumName: "Album",
//    albumArtImageUrl: "assets/AlbumImages/art6.jpg",
//    artistName: "Shosmo",
//  ),
//  Album(
//    albumName: "Album",
//    albumArtImageUrl: "assets/AlbumImages/art5.jpg",
//    artistName: "Shosmo",
//  ),
];

final List<Album> gridAlbumExamples = [
  Album(
    artist: Artist(
      uid: "ddd",
    ),
    albumName: "fff",
    albumID: "12222",
    albumArtImageUrl: "assets/AlbumImages/art1.jpg",
  ),
  Album(
    artist: Artist(
      uid: "ddd",
    ),
    albumName: "fff",
    albumID: "12222",
    albumArtImageUrl: "assets/AlbumImages/art1.jpg",
  ),
  Album(
    artist: Artist(
      uid: "ddd",
    ),
    albumName: "fff",
    albumID: "12222",
    albumArtImageUrl: "assets/AlbumImages/art1.jpg",
  ),
  Album(
    artist: Artist(
      uid: "ddd",
    ),
    albumName: "fff",
    albumID: "12222",
    albumArtImageUrl: "assets/AlbumImages/art1.jpg",
  )
//  Album(
//    albumName: "Album",
//    albumArtImageUrl: "assets/AlbumImages/art12.jpg",
//    artistName: "Shosmo",
//  ),
//  Album(
//    albumName: "Album",
//    albumArtImageUrl: "assets/AlbumImages/art7.png",
//    artistName: "Shosmo",
//  ),
//  Album(
//    albumName: "Album",
//    albumArtImageUrl: "assets/AlbumImages/art8.jpg",
//    artistName: "Shosmo",
//  ),
//  Album(
//    albumName: "Album",
//    albumArtImageUrl: "assets/AlbumImages/art11.jpg",
//    artistName: "Shosmo",
//  ),
];

final List<Genre> genreExamples = [
  Genre(
    genreName: "Jazz",
    genreImageUrl: "assets/GenresImages/jazz.png",
  ),
  Genre(
    genreName: "Pop",
    genreImageUrl: "assets/GenresImages/pop.png",
  ),
  Genre(
    genreName: "Classic",
    genreImageUrl: "assets/GenresImages/classic.png",
  ),
  Genre(
    genreName: "Rock and Roll",
    genreImageUrl: "assets/GenresImages/rocknroll.jpg",
  ),
];

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  SizeConfig _sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);

    Widget _exploreText = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical,
        left: SizeConfig.blockSizeHorizontal * 2,
        bottom: SizeConfig.blockSizeVertical * 2.5,
      ),
      child: Text(
        "Explore",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 34,
        ),
      ),
    );

    DefaultMusicRow _recentlyPlayed = DefaultMusicRow(
      title: "Recently Played",
      musicElements: albumExamples,
    );

    DefaultMusicRow _recommendedForYou = DefaultMusicRow(
      title: "Recommended For You",
      musicElements: albumExamples,
    );

    MuiscGrid _top50Widget = MuiscGrid(
      title: "Top 50",
      musicElements: gridAlbumExamples,
    );

    Widget _artistRow = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          circularArtistView(),
          circularArtistView(),
          circularArtistView(),
          circularArtistView(),
          circularArtistView(),
        ],
      ),
    );

    Widget _popularArtists = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 1.5,
            left: SizeConfig.blockSizeHorizontal * 2,
            bottom: SizeConfig.blockSizeVertical,
          ),
          child: Text(
            "Popular Artists",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 21,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal),
          child: _artistRow,
        ),
      ],
    );

    GenresRow _genresAndMoods = GenresRow(
      genreElements: genreExamples,
      title: "Genres and Moods",
    );

    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _exploreText,
                _recentlyPlayed,
                _recommendedForYou,
              ],
            ),
          ),
          _top50Widget,
          SliverList(
            delegate: SliverChildListDelegate([
              _popularArtists,
              _genresAndMoods,
            ]),
          )
        ],
      ),
    );
  }
}
