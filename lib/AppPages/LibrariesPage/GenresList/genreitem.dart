//TODO: to be replaced with Discovery after Discovery was made dynamic
import 'package:assets_audio_player_example/modules/genre.dart';
import 'package:flutter/material.dart';

class GenreItem extends StatelessWidget {
  final Genre genre;

  const GenreItem({Key key, this.genre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                genre.genreImageUrl,
                fit: BoxFit.cover,
              ),
              ),
            ),
            Center(
              child: Text(
                genre.genreName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // gradient: LinearGradient(
          //   colors: [Color(0xFFE63946), Color(0xFF1D3557)],
          //   tileMode: TileMode.clamp, // repeats the gradient over the canvas
          // ),
        ),
      ),
    );
  }
}
