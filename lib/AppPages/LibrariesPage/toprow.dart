import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/presentation/cutsom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../SizeConfig.dart';

class TopRow extends StatelessWidget {
  final Function goBack;

  const TopRow({Key key, this.goBack}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 40, bottom: SizeConfig.blockSizeVertical * 4),
      child: GestureDetector(
        onTap: (){
          Provider.of<Queue>(context,listen: false).buildFromLibrary();
        },
        child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 32,
              color: Colors.black,
            ),
            onPressed: () {
              goBack();
            },
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
      ),
    );
  }
}
