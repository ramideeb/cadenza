import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class GenreWidget extends StatelessWidget {
  final String genreImageURL;
  final String genreName;

  GenreWidget({Key key, this.genreImageURL, this.genreName}) : super(key: key);

  SizeConfig _sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);
    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal),
          child: SizedBox(
            height: SizeConfig.blockSizeHorizontal * 30,
            width: SizeConfig.blockSizeHorizontal * 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset("${this.genreImageURL}",fit: BoxFit.fill,),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            this.genreName,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 5.5,
            ),
          ),
        ),
        // Text(
        //   this.artistName,
        //   style: TextStyle(
        //     color: Colors.grey,
        //     fontSize: SizeConfig.blockSizeHorizontal * 3,
        //   ),
        // ),
      ],
    );
  }
}
