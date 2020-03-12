import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Album extends StatelessWidget {
  List<String> litems = [
    "Intro",
    "Bad Luck",
    "My Bad",
    "Better",
    "Talk",
    "right Back",
    "Don't Pretend (Ft. SAFE)",
    "Paradise",
    "Hundres",
    "Outta My Head by Khalid & John Mayer",
    "Free Spirit",
    "Twenty One",
    "Bluffin'",
    "Self",
    "Alive",
    "Heaven",
    "Saturda y Nights",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
//                 width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                    child: Hero(
                      tag: "album",
                      transitionOnUserGestures: true,
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.star),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Free Spirit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                          height: 0,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.album,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            "khalid",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: -20,
                  child: Container(
                    height: 60,
                    width: 60,
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
                        size: 35,
                      ),
                      elevation: 0,
                      onPressed: () => {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: litems.asMap().entries.map((MapEntry map) {
                return Column(
                  children: <Widget>[
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 6,right: 5,left: 5),
                          child: Icon(
                            Icons.audiotrack,
                            color: Color.fromRGBO(230, 57, 70, 1),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                litems[map.key],
                                style: TextStyle(
                                    color: Color(0xff1D3557),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6),
                              ),
                              Text(
                                "Khalid",
                                style: TextStyle(
                                    color: Color(0xC01D3557),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
