import 'dart:ui';

import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  final double musicDuration = 100;

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double timestamp = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "PLAY LIST",
                        style: TextStyle(
                          height: 1,
                          color: Color(0XFF1D3557),
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Raleway",
                        ),
                      ),
                      Text(
                        "Likes Songs",
                        style: TextStyle(
                          color: Color(0XFF1D3557),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Raleway",
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.playlist_play),
                  onPressed: () {},
                ),
              ],
            ),
//          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      image: NetworkImage(
                        "https://images-na.ssl-images-amazon.com/images/I/91zZQ3p3HEL._SL1500_.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                Text(
                  "Better",
                  style: TextStyle(
                      height: 1,
                      color: Color(0XFF1D3557),
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6),
                ),
                Text(
                  "Free Spirit",
                  style: TextStyle(
                      color: Color(0XFF1D3557),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                children: <Widget>[
                  Slider(
                    onChanged: (double value) {
                      setState(() {
                        timestamp = value;
                      });
                    },
                    value: timestamp,
                    max: widget.musicDuration,
                    min: 0,
                    inactiveColor: Color(0x5F1D3557),
                    activeColor: Color(0XFFE63946),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("2:23"),
                        Text("10:0"),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.shuffle),
                        onPressed: () {},
                        color: Color(0XCC1D3557),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.skip_previous,
                              size: 45,
                            ),
                            padding: new EdgeInsets.all(0.0),
                            onPressed: () {},
                            color: Color(0XCC1D3557),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0.0, 2.0),
                                      blurRadius: 6.0)
                                ]),
                            child: FloatingActionButton(
                              backgroundColor: Color.fromRGBO(230, 57, 70, 1),
                              child: Icon(
                                Icons.play_arrow,
                                size: 45,
                              ),
                              elevation: 0,
                              onPressed: () => {},
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.skip_next,
                              size: 45,
                            ),
                            padding: new EdgeInsets.all(0.0),
                            onPressed: () {},
                            color: Color(0XCC1D3557),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.repeat),
                        onPressed: () {},
                        color: Color(0XCC1D3557),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
