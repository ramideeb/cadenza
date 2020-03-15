import 'package:assets_audio_player_example/presentation/cutsom_icons_icons.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class TopRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 40, bottom: SizeConfig.blockSizeVertical * 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 32,
              color: Colors.black,
            ),
            onPressed: null,
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal * 48,
            height: SizeConfig.blockSizeVertical * 8,
            decoration: BoxDecoration(
              color: Color.fromRGBO(230, 57, 70, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  CutsomIcons.random,
                  color: Colors.white,
                  size: 22,
                ),
                Text(
                  "Shuffle",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal)
              ],
            ),
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal * 10)
        ],
      ),
    );
  }
}