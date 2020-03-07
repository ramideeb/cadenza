import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class AlbumArtWidget extends StatelessWidget {
  final String artImageURL;
  final String albumName;
  final String artistName;

  AlbumArtWidget({this.artImageURL, this.albumName, this.artistName});
  SizeConfig _sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              height: SizeConfig.blockSizeHorizontal * 35,
              width: SizeConfig.blockSizeHorizontal * 35,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset("${this.artImageURL}"),
              ),
            ),   
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal*1.5),
            child: Text(
              this.albumName,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.blockSizeHorizontal * 5,
              ),
            ),
          ),
          Text(
            this.artistName,
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
