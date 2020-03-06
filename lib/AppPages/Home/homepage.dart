import 'package:assets_audio_player_example/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'albumartwidget.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  SizeConfig _sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);

    Widget _musicRow = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: <Widget>[
          AlbumArtWidget(
            albumName: "Album",
            artImageURL: "assets/AlbumImages/art2.jpg",
            artistName: "Shosmo",
          ),
          AlbumArtWidget(
            albumName: "Album",
            artImageURL: "assets/AlbumImages/art3.jpg",
            artistName: "Shosmo",
          ),
          AlbumArtWidget(
            albumName: "Album",
            artImageURL: "assets/AlbumImages/art6.jpg",
            artistName: "Shosmo",
          ),
          AlbumArtWidget(
            albumName: "Album",
            artImageURL: "assets/AlbumImages/art5.jpg",
            artistName: "Shosmo",
          ),
        ]));

    Widget _recentlyPlayedColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeHorizontal * 2.5,
            left: SizeConfig.blockSizeHorizontal * 2,
            bottom: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          child: Text(
            "Recently Played",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.blockSizeHorizontal * 5,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal),
          child: _musicRow,
        ),
      ],
    );

    Widget _recommendedForYouColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeHorizontal * 2.5,
            left: SizeConfig.blockSizeHorizontal * 2,
            bottom: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          child: Text(
            "Recommended For You",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.blockSizeHorizontal * 5,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal),
          child: _musicRow,
        ),
      ],
    );

    Widget _top50Widget = Padding(
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
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5)),
                    child: Image.asset("assets/AlbumImages/art6.jpg"),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(5)),
                    child: Image.asset("assets/AlbumImages/art7.png"),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(5)),
                    child: Image.asset("assets/AlbumImages/art8.jpg"),
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 200,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(5)),
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

    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
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
          ),
          _recentlyPlayedColumn,
          _recommendedForYouColumn,
          _top50Widget,
        ],
      ),
    );
  }
}
