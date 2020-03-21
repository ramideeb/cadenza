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
      height: SizeConfig.blockSizeVertical*28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genreElements.length,
        itemBuilder: (con, i) => GenreWidget(
          genre: genreElements[i],
        ),
      ),
      );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 1.5,
            left: SizeConfig.blockSizeHorizontal * 2,
            bottom: SizeConfig.blockSizeVertical,
          ),
          child: Text(
            "$title",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 21,
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
