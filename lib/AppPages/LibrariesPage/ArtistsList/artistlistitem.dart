import 'package:assets_audio_player_example/modules/artist.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

class ArtistListItem extends StatelessWidget {
  final Artist artist;

  const ArtistListItem({Key key, this.artist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 5,
        bottom: SizeConfig.blockSizeVertical,
        top: SizeConfig.blockSizeVertical,

      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2020/01/31/07/53/cartoon-4807395_960_720.jpg',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${artist.artistName}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${artist.songsCount} songs",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(131, 131, 131, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
