import 'package:cadenza/modules/playlist.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

class PlaylistItemMinimized extends StatelessWidget {
  final Playlist playlist;
  final Function(Playlist) showPlaylist;

  const PlaylistItemMinimized({Key key, this.playlist, this.showPlaylist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showPlaylist(playlist);
      },
      child: Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.3,
            color: Color.fromRGBO(112, 112, 112, 1),
          ),
          borderRadius: BorderRadius.circular(14)),
      height: SizeConfig.blockSizeHorizontal * 25,
      width: SizeConfig.blockSizeHorizontal * 25,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                playlist.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              "${playlist.playlistName}",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    ),
    );
  }
}