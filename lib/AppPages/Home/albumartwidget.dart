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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              height: SizeConfig.blockSizeVertical * 20,
              width: SizeConfig.blockSizeVertical * 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset("${this.artImageURL}"),
              ),
            ),   
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical),
            child: Text(
              this.albumName,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            this.artistName,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
