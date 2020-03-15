import 'package:assets_audio_player_example/AppPages/LibrariesPage/ArtistsList/artistlistitem.dart';
import 'package:assets_audio_player_example/modules/artist.dart';
import 'package:flutter/material.dart';

class ArtistGrid extends StatelessWidget {
  final List<Artist> items;

  const ArtistGrid({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (con, i) => ArtistListItem(
          artist: items[i],
        ),
        childCount: items.length,
      ),
    );
  }
}
