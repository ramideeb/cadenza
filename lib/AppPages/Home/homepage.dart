import 'package:assets_audio_player_example/AppPages/Home/musicrow.dart';
import 'package:assets_audio_player_example/AppPages/PublicWidgets/circularArtistView.dart';
import 'package:assets_audio_player_example/SizeConfig.dart';
import 'package:assets_audio_player_example/modules/Album.dart';
import 'package:flutter/material.dart';
import 'albumartwidget.dart';
import 'genreswidget.dart';

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
        top: SizeConfig.blockSizeHorizontal * 2.5,
        left: SizeConfig.blockSizeHorizontal * 2,
        bottom: SizeConfig.blockSizeHorizontal * 1.5,
      ),
      child: Text(
        "Explore",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.blockSizeHorizontal * 10,
        ),
      ),
    );

    // Widget _musicRow = SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     children: <Widget>[
    //       AlbumArtWidget(
    //         albumName: "Album",
    //         artImageURL: "assets/AlbumImages/art2.jpg",
    //         artistName: "Shosmo",
    //       ),
    //       AlbumArtWidget(
    //         albumName: "Album",
    //         artImageURL: "assets/AlbumImages/art3.jpg",
    //         artistName: "Shosmo",
    //       ),
    //       AlbumArtWidget(
    //         albumName: "Album",
    //         artImageURL: "assets/AlbumImages/art6.jpg",
    //         artistName: "Shosmo",
    //       ),
    //       AlbumArtWidget(
    //         albumName: "Album",
    //         artImageURL: "assets/AlbumImages/art5.jpg",
    //         artistName: "Shosmo",
    //       ),
    //     ],
    //   ),
    // );

    // Widget _recentlyPlayedColumn = Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: <Widget>[
    //     Padding(
    //       padding: EdgeInsets.only(
    //         top: SizeConfig.blockSizeHorizontal * 2.5,
    //         left: SizeConfig.blockSizeHorizontal * 2,
    //         bottom: SizeConfig.blockSizeHorizontal * 1.5,
    //       ),
    //       child: Text(
    //         "Recently Played",
    //         style: TextStyle(
    //           fontWeight: FontWeight.w700,
    //           fontSize: SizeConfig.blockSizeHorizontal * 5,
    //         ),
    //       ),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal),
    //       child: _musicRow,
    //     ),
    //   ],
    // );

    // Widget _recommendedForYouColumn = Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: <Widget>[
    //     Padding(
    //       padding: EdgeInsets.only(
    //         top: SizeConfig.blockSizeHorizontal * 2.5,
    //         left: SizeConfig.blockSizeHorizontal * 2,
    //         bottom: SizeConfig.blockSizeHorizontal * 1.5,
    //       ),
    //       child: Text(
    //         "Recommended For You",
    //         style: TextStyle(
    //           fontWeight: FontWeight.w700,
    //           fontSize: SizeConfig.blockSizeHorizontal * 5,
    //         ),
    //       ),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal),
    //       child: _musicRow,
    //     ),
    //   ],
    // );

    DefaultMusicRow _recentlyPlayed = DefaultMusicRow(title: "Recently Played",musicElements: albumExamples,);

    DefaultMusicRow _recommendedForYou = DefaultMusicRow(title: "Recommended For You",musicElements: albumExamples,);

    Widget _topWidget = Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 175,
                height: 175,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(14)),
                  child: Image.asset("assets/AlbumImages/art6.jpg"),
                ),
              ),
              SizedBox(
                width: 175,
                height: 175,
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(14)),
                      child: Image.asset("assets/AlbumImages/art8.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 15),
                      child: Text(
                        "Top 50",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 175,
                height: 175,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(14)),
                  child: Image.asset("assets/AlbumImages/art7.png"),
                ),
              ),
              SizedBox(
                width: 175,
                height: 175,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(14)),
                  child: Image.asset("assets/AlbumImages/art11.jpg"),
                ),
              ),
            ],
          )
        ],
      ),
    );

    Widget _top50Widget = SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      sliver: SliverGrid.count(
        childAspectRatio: 1.2,
        crossAxisCount: 2,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(14)),
            child: Image.asset(
              "assets/AlbumImages/art12.jpg",
              fit: BoxFit.fill,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(14)),
            child: Image.asset(
              "assets/AlbumImages/art7.png",
              fit: BoxFit.fill,
            ),
          ),
          Stack(
            fit: StackFit.expand,
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(14)),
                child: Image.asset(
                  "assets/AlbumImages/art8.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 15),
                child: Text(
                  "Top 50",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
            child: Image.asset(
              "assets/AlbumImages/art11.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
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

    Widget _genreRow = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          GenreWidget(
            genreName: "Jazz",
            genreImageURL: "assets/GenresImages/jazz.jpg",
          ),
          GenreWidget(
            genreName: "Pop",
            genreImageURL: "assets/GenresImages/pop.jpg",
          ),
          GenreWidget(
            genreName: "Rap",
            genreImageURL: "assets/GenresImages/rap.jpg",
          ),
          GenreWidget(
            genreName: "Rock and Roll",
            genreImageURL: "assets/GenresImages/rocknroll.jpg",
          ),
        ],
      ),
    );

    Widget _genresAndMoods = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeHorizontal * 2.5,
            left: SizeConfig.blockSizeHorizontal * 2,
            bottom: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          child: Text(
            "Genres and Moods",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.blockSizeHorizontal * 5,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal),
          child: _genreRow,
        ),
      ],
    );

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            _exploreText,
            _recentlyPlayed,
            _recommendedForYou,
          ]),
        ),
        _top50Widget,
        SliverList(
          delegate: SliverChildListDelegate([
            _popularArtists,
            _genresAndMoods,
          ]),
        )
      ],
    );
  }
}

Widget _top50Widget2 = Padding(
  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
  child: Stack(
    children: <Widget>[
      Opacity(
        opacity: 0.85,
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5)),
                child: Image.asset("assets/AlbumImages/art6.jpg"),
              ),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(5)),
                child: Image.asset("assets/AlbumImages/art7.png"),
              ),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5)),
                child: Image.asset("assets/AlbumImages/art8.jpg"),
              ),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5)),
                child: Image.asset("assets/AlbumImages/art11.jpg"),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 240, left: 15),
        child: Text(
          "Top 50",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  ),
);
