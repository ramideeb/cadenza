import 'package:assets_audio_player_example/modules/genre.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';
import 'genreswidget.dart';

class GenresRow extends StatelessWidget {
  final List<Genre> genreElements;
  final String title;

  const GenresRow({Key key, this.genreElements, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _genreRow = SizedBox(
      height: SizeConfig.blockSizeHorizontal*40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genreElements.length,
        itemBuilder: (con, i) => GenreWidget(
          genreImageURL: genreElements[i].genreImageUrl,
          genreName: genreElements[i].genreName,
        ),
      ),
      );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeHorizontal * 2.5,
            left: SizeConfig.blockSizeHorizontal * 2,
            bottom: SizeConfig.blockSizeHorizontal * 1.5,
          ),
          child: Text(
            "$title",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.blockSizeHorizontal * 5,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal),
          child: _genreRow,
        ),
      ],
    );
  }
}