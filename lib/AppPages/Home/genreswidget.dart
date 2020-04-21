import 'package:cadenza/modules/genre.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class GenreWidget extends StatelessWidget {
  final Genre genre;

  final SizeConfig _sizeConfig = SizeConfig();

  GenreWidget({Key key, this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);
    return FutureBuilder(
      future: FirebaseStorage.instance
          .ref()
          .child(genre.genreImageUrl)
          .getDownloadURL(),
      builder: (con, url) {
        if (url.connectionState == ConnectionState.waiting || url.hasError)
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
                      "assets/GenresImages/nogenre.png",
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
            ],
          );
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
                  child: Image.network(
                    url.data,
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Image.asset("assets/GenresImages/nogenre.png");
                    },
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
          ],
        );
      },
    );
  }
}
