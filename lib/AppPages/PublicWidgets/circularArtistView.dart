import 'package:flutter/material.dart';

class circularArtistView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        CircleAvatar(
          radius: 55,
          backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2020/01/31/07/53/cartoon-4807395_960_720.jpg',
          ),
        ),
        Text("Rami Theeb")
      ]),
    );
  }
}
