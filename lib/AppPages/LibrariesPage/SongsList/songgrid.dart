import 'package:cadenza/AppPages/LibrariesPage/SongsList/songitem.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/song.dart';
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
