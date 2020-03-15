import 'package:assets_audio_player_example/AppPages/LibrariesPage/GenresList/genreitem.dart';
import 'package:assets_audio_player_example/modules/genre.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

class GenresGrid extends StatelessWidget {
  final List<Genre> items;

  const GenresGrid({Key key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 5,
        vertical: SizeConfig.blockSizeVertical * 5,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2.125,
          crossAxisSpacing: SizeConfig.blockSizeHorizontal * 2,
          mainAxisSpacing: SizeConfig.blockSizeVertical * 3,
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (con, i) => Container(
            alignment: Alignment.center,
            child: GenreItem(
              genre: items[i],
            ),
          ),
          childCount: items.length,
        ),
      ),
    );
  }
}
