import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/song.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class AlbumArtWidget extends StatelessWidget {
  final Album album;
  final Function(Album) showAlbum;

  final SizeConfig _sizeConfig = SizeConfig();

  AlbumArtWidget({Key key, this.album, this.showAlbum}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);

    return GestureDetector(
      onTap: () {
        if (album.isSnippet) {
          album.albumRef.get().then((snapshot) {
            if (snapshot.exists) {
              for (String key in snapshot.data["songs"].keys) {
                album.albumSongs.add(OnlineSong(
                  songID: key,
                  url: snapshot.data['songs'][key]["songURL"],
                  name: snapshot.data['songs'][key]['songName'],
                  album: album,
                  albumTitle: album.albumName,
                  artistName: album.artistName,
                  albumArtURL: album.albumArtImageUrl,
                  artistRef: album.artistRef,
                  genreName: album.genreName,
                ));
              }
              album.isSnippet = false;
              showAlbum(album);
            }
          });
        } else
          showAlbum(album);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: SizeConfig.blockSizeVertical * 19,
              width: SizeConfig.blockSizeVertical * 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: FutureBuilder<dynamic>(
                  future: FirebaseStorage.instance
                      .ref()
                      .child(album.albumArtImageUrl)
                      .getDownloadURL(),
                  builder: (con, url) {
                    if (url.connectionState == ConnectionState.waiting ||
                        url.hasError) {
                      return Image.asset("assets/AlbumImages/noart.png");
                    }
                    return Image.network(
                      url.data,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          color: Colors.black12,
                        );
                      },
                    );
                  },
                ),
                // child: Image.network(
                //   url.data,
                //   loadingBuilder: (context, child, progress) {
                //     if (progress == null) return child;
                //     return Image.asset("assets/AlbumImages/noart.png");
                //   },
                // ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical),
              child: Text(
                (album.albumName.length <= 12)
                    ? album.albumName
                    : '${album.albumName.substring(0, 12)}...',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              (album.artistName.length <= 18)
                  ? album.artistName
                  : "${album.artistName.substring(0, 18)}...",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
