import 'package:cadenza/modules/artist.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

class ArtistListItem extends StatelessWidget {
  final Artist artist;

  const ArtistListItem({Key key, this.artist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 5,
        bottom: SizeConfig.blockSizeVertical,
        top: SizeConfig.blockSizeVertical,
      ),
      child: Row(
        children: <Widget>[
          FutureBuilder(
            future: FirebaseStorage.instance
                .ref()
                .child(artist.profilePictureURL)
                .getDownloadURL(),
            builder: (context, url) {
              if (url.connectionState == ConnectionState.waiting ||
                  url.hasError)
                return CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2020/01/31/07/53/cartoon-4807395_960_720.jpg',
                  ),
                );
              return CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  url.data,
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${artist.username}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${artist.songsCount} songs",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(131, 131, 131, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
