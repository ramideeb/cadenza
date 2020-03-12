import 'package:assets_audio_player_example/modules/playlist.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class PlayListItem extends StatelessWidget {
  final Playlist playlist;

  const PlayListItem({Key key, this.playlist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 2,
      ),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 95,
        height: SizeConfig.blockSizeVertical * 30,
        decoration: BoxDecoration(
          border:
              Border.all(width: 0.5, color: Color.fromRGBO(112, 112, 112, 1)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Opacity(
              opacity: 0.82,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  playlist.imageUrl,
                  fit: BoxFit.fill,
                  width: SizeConfig.blockSizeHorizontal * 80,
                ),
              ),
            ),
            Positioned(
              left: SizeConfig.blockSizeHorizontal * 8,
              top: SizeConfig.blockSizeVertical * 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "${playlist.name}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                    child: Container(
                      width: 100,
                      child: Text(
                        "${playlist.description}",
                        style: TextStyle(
                          color: Color.fromRGBO(114, 110, 110, 1),
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: SizeConfig.blockSizeHorizontal * 70,
              top: SizeConfig.blockSizeVertical * 18,
              child: Icon(
                Icons.play_circle_filled,
                size: 55,
              ),
            )
          ],
        ),
      ),
    );
  }
}