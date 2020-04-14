import 'package:cadenza/modules/song.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

class SongItem extends StatelessWidget {
  final Song song;

  const SongItem({Key key, this.song}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("username is ${song.artist.username}");
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 2.5,
        vertical: SizeConfig.blockSizeVertical * 1.2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                song.name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                song.artist.username,
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(131, 131, 131, 1),
                ),
              ),
            ],
          ),
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}