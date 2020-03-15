import 'package:assets_audio_player_example/AppPages/Home/albumartwidget.dart';
import 'package:assets_audio_player_example/modules/Album.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

class AlbumsGrid extends StatelessWidget {
  final List<Album> items;

  AlbumsGrid({Key key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 5,
          vertical: SizeConfig.blockSizeVertical * 5),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (con, i) => Container(
            alignment: Alignment.center,
            child: AlbumArtWidget(
              album: items[i],
            ),
          ),
          childCount: items.length,
        ),
      ),
    );
  }
}
