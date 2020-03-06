import 'package:assets_audio_player_example/SizeConfig.dart';
import 'package:assets_audio_player_example/widgets/albumartwidget.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  SizeConfig _sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);

    Widget _recentlyPlayedRow = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: <Widget>[
          AlbumArtWidget(
            albumName: "Album",
            artImageURL: "art2.jpg",
            artistName: "Shosmo",
          ),
          AlbumArtWidget(
            albumName: "Album",
            artImageURL: "art2.jpg",
            artistName: "Shosmo",
          ),
          AlbumArtWidget(
            albumName: "Album",
            artImageURL: "art2.jpg",
            artistName: "Shosmo",
          ),
          AlbumArtWidget(
            albumName: "Album",
            artImageURL: "art2.jpg",
            artistName: "Shosmo",
          ),
        ]));
    return Container(
        child: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.blockSizeHorizontal * 2.5,
              left: SizeConfig.blockSizeHorizontal * 2),
          child: Text(
            "Explore",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.blockSizeHorizontal * 10,
            ),
          ), 
        ),
        _recentlyPlayedRow,
      ],
    ));
  }
}
