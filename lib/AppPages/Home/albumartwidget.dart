import 'package:assets_audio_player_example/modules/Album.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class AlbumArtWidget extends StatelessWidget {
  final Album album;
  
  final SizeConfig _sizeConfig = SizeConfig();

  AlbumArtWidget({Key key, this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              height: SizeConfig.blockSizeHorizontal * 35,
              width: SizeConfig.blockSizeHorizontal * 35,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset("${album.albumArtImageUrl}"),
              ),
            ),   
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal*1.5),
            child: Text(
              album.albumName,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: SizeConfig.blockSizeHorizontal * 5,
              ),
            ),
          ),
          Text(
            album.artistName,
            style: TextStyle(
              color: Colors.grey,
              fontSize: SizeConfig.blockSizeHorizontal * 3,
            ),
          ),
        ],
      ),
    );
  }
}
