import 'package:assets_audio_player_example/modules/Album.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';
import 'albumartwidget.dart';

class DefaultMusicRow extends StatelessWidget {
  final List<Album> musicElements;
  final String title;
  List<Widget> elements= [];
  DefaultMusicRow({Key key, this.musicElements, this.title}) : super(key: key) {
    for (var i = 0; i < musicElements.length; i++) {
      elements.add(
        AlbumArtWidget(
          albumName: musicElements[i].albumName,
          artImageURL: musicElements[i].albumArtImageUrl,
          artistName: musicElements[i].artistName,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget _musicRow = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: elements,
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
  }
}
// ListView.builder(
//         itemCount: musicElements.length,
//         itemBuilder: (con,i)=> AlbumArtWidget(
//           albumName: musicElements[i].albumName,
//           artImageURL: musicElements[i].albumArtImageUrl,
//           artistName: musicElements[i].artistName,
//         ),
//       ),
