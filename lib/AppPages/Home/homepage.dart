import 'package:assets_audio_player_example/AppPages/Home/genresrow.dart';
import 'package:assets_audio_player_example/AppPages/Home/musicgrid.dart';
import 'package:assets_audio_player_example/AppPages/Home/musicrow.dart';
import 'package:assets_audio_player_example/AppPages/PublicWidgets/circularArtistView.dart';
import 'package:assets_audio_player_example/SizeConfig.dart';
import 'package:assets_audio_player_example/modules/Album.dart';
import 'package:assets_audio_player_example/modules/genre.dart';
import 'package:flutter/material.dart';
// import 'genreswidget.dart';

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

final List<Album> gridAlbumExamples = [
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art12.jpg",
    artistName: "Shosmo",
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art7.png",
    artistName: "Shosmo",
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art8.jpg",
    artistName: "Shosmo",
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art11.jpg",
    artistName: "Shosmo",
  ),
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
        top: SizeConfig.blockSizeHorizontal * 6,
        left: SizeConfig.blockSizeHorizontal * 2,
        bottom: SizeConfig.blockSizeHorizontal * 4,
      ),
      child: Text(
        "Explore",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: SizeConfig.blockSizeHorizontal * 10,
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
            top: SizeConfig.blockSizeHorizontal * 2.5,
            left: SizeConfig.blockSizeHorizontal * 2,
            bottom: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          child: Text(
            "Popular Artists",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.blockSizeHorizontal * 5,
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
      padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*2),
      child: 
        CustomScrollView(
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
