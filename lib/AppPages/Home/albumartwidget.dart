import 'package:cadenza/modules/Album.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class AlbumArtWidget extends StatelessWidget {
  final Album album;

  final SizeConfig _sizeConfig = SizeConfig();

  AlbumArtWidget({Key key, this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);
   
    return FutureBuilder<dynamic>(
        future: FirebaseStorage.instance
            .ref()
            .child(album.albumArtImageUrl)
            .getDownloadURL(),
        builder: (context, url) {
          
          if (url.connectionState == ConnectionState.waiting || url.hasError)
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
                      child: Image.asset("assets/AlbumImages/noart.png"),
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
            );
          
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
                    child: Image.network(
                      url.data,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Image.asset("assets/AlbumImages/noart.png");
                      },
                    ),
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
          );
        });
  }
}
