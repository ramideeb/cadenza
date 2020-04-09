import 'package:cadenza/modules/genre.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class GenreWidget extends StatelessWidget {
  final Genre genre;

  final SizeConfig _sizeConfig = SizeConfig();

  GenreWidget({Key key, this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal,
          ),
          child: SizedBox(
            height: SizeConfig.blockSizeVertical * 20,
            width: SizeConfig.blockSizeVertical * 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                "${genre.genreImageUrl}",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            genre.genreName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
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
