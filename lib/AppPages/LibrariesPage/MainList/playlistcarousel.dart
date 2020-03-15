import 'package:assets_audio_player_example/AppPages/LibrariesPage/MainList/playlistitem.dart';
import 'package:assets_audio_player_example/modules/playlist.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

class PlaylistsCarousel extends StatelessWidget {
  final List<Playlist> items;

  const PlaylistsCarousel({Key key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (con, i) => PlayListItem(
        playlist: items[i],
      ),
      autoPlay: true,
      autoPlayAnimationDuration: Duration(seconds: 2),
      viewportFraction: 1.0,
      height: SizeConfig.blockSizeVertical * 30,
    );
  }
}
