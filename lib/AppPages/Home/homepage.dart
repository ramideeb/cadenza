import 'package:assets_audio_player_example/SizeConfig.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView(
        children: <Widget>[
          Padding(
            padding: null,
            child: Text(
              "Explore",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal*2,
              ),
              ),
          )
        ],
      )
     
      
    );
  }
}
//  SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Row(
//    children: <Widget>[
//      Text('hi'),
//      Text('hi'),
//      Text('hi'),
//    ]
//   )
// )