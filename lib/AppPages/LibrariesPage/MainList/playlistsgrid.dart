import 'package:cadenza/AppPages/LibrariesPage/MainList/playlistitemminimized.dart';
import 'package:cadenza/modules/playlist.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

class PlaylistsGrid extends StatelessWidget {
  final List<Playlist> items;

  const PlaylistsGrid({Key key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 3,
          right: SizeConfig.blockSizeHorizontal * 3,
          bottom: SizeConfig.blockSizeVertical * 3),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: SizeConfig.blockSizeHorizontal * 8,
          mainAxisSpacing: SizeConfig.blockSizeVertical * 3,
          crossAxisCount: 2,

        ),
        delegate: SliverChildBuilderDelegate(
          
          (con, i) {
            return PlaylistItemMinimized(
              playlist: items[i],
            );
          },
          childCount: items.length,
        ),
      ),
    );
  }
}
