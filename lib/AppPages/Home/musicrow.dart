import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/song.dart';
import 'package:flutter/material.dart';
import '../../SizeConfig.dart';
import 'albumartwidget.dart';

class DefaultMusicRow extends StatelessWidget {
  final List<Song> musicElements;
  final String title;

  DefaultMusicRow({Key key, this.musicElements, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Album> albumList = [];
    for (int i = 0; i < musicElements.length; i++) {
      OnlineSong songItem = musicElements[i];
      Album newAlbum = Album(
        albumName: songItem.albumTitle,
        albumID: songItem.albumRef.documentID,
        artistName: songItem.artistName,
        albumArtImageUrl: songItem.albumArtURL,
      );
      // albumList.forEach((a) {
      //   if (a.albumID == newAlbum.albumID) albumList.remove(a);
      // });
      albumList.add(newAlbum);

    }
    Widget _musicRow = SizedBox(
      height: SizeConfig.blockSizeVertical * 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: albumList.length,
          itemBuilder: (con, i) => AlbumArtWidget(
                album: albumList[i],
              )),
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
            "${this.title}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal),
          child: _musicRow,
        ),
      ],
    );
  }
}
