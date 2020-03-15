import 'package:assets_audio_player_example/AppPages/LibrariesPage/SongsList/songitem.dart';
import 'package:assets_audio_player_example/modules/song.dart';
import 'package:flutter/material.dart';

class SongsGrid extends StatelessWidget {
  final List<Song> items;

  const SongsGrid({Key key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (con, i) => SongItem(
          song: items[i],
        ),
        childCount: items.length
      ),

    );
  }
}
