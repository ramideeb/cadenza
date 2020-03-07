import 'package:assets_audio_player_example/modules/Album.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';
import 'albumartwidget.dart';

class DefaultMusicRow extends StatelessWidget {
  final List<Album> musicElements;

  const DefaultMusicRow({Key key, this.musicElements}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _musicRow = ListView.builder(
      itemCount: musicElements.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) => AlbumArtWidget(
        albumName: musicElements[i].albumName,
        artImageURL: musicElements[i].albumArtImageUrl,
        artistName: musicElements[i].artistName,
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
  }
}
