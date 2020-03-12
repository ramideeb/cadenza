import 'package:assets_audio_player_example/modules/Album.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';
import 'albumartwidget.dart';

class DefaultMusicRow extends StatelessWidget {
  final List<Album> musicElements;
  final String title;
  
  DefaultMusicRow({Key key, this.musicElements, this.title}) : super(key: key) ;
  
  @override
  Widget build(BuildContext context) {
    
    Widget _musicRow = SizedBox(
      height: SizeConfig.blockSizeHorizontal * 49,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: musicElements.length,
        itemBuilder: (con, i) => AlbumArtWidget(
          albumName: musicElements[i].albumName,
          artImageURL: musicElements[i].albumArtImageUrl,
          artistName: musicElements[i].artistName,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeHorizontal * 2.5,
            left: SizeConfig.blockSizeHorizontal * 2,
            bottom: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          child: Text(
            "${this.title}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.blockSizeHorizontal * 6,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal),
          child: _musicRow,
        ),
      ],
    );
  }
}