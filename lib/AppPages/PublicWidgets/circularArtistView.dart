import 'package:cadenza/modules/artist.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class circularArtistView extends StatelessWidget {
  final Artist artist;

  const circularArtistView({Key key, this.artist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: FirebaseStorage.instance
            .ref()
            .child(artist.profilePictureURL)
            .getDownloadURL(),
        builder: (context, url) {
          if (url.connectionState == ConnectionState.waiting || url.hasError)
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2020/01/31/07/53/cartoon-4807395_960_720.jpg',
                  ),
                ),
                Text(artist.username)
              ]),
            );
         
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(
                  url.data,
                ),
              ),
              Text(artist.username)
            ]),
          );
        });
  }
}
