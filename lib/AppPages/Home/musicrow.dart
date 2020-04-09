import 'package:cadenza/modules/Album.dart';
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
      height: SizeConfig.blockSizeVertical*30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: musicElements.length,
        itemBuilder: (con, i) => AlbumArtWidget(
          album: musicElements[i],
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical*1.5,
            left: SizeConfig.blockSizeHorizontal * 2,
            bottom: SizeConfig.blockSizeVertical,
          ),
          child: Text(
            "${this.title}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
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
