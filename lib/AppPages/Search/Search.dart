import 'package:assets_audio_player_example/AppPages/Search/SearchBar.dart';
import 'package:assets_audio_player_example/AppPages/Search/SearchResult.dart';
import 'package:flutter/material.dart';
import 'DiscoveryWidget.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static TextEditingController _controller;
  static TextEditingController _controllerSearchBar;
  static bool _searching = false;

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controllerSearchBar = TextEditingController();
  }

  void dispose() {
//    _controller.dispose();
    super.dispose();
  }

  void changeState(String value) {
    setState(() {
      if (value.length == 0)
        _searching = false;
      else {
        _searching = true;
      }
    });
  }

  //TODO: no need for it can delete it 
  TextField searchBar = TextField(
    enabled: false,
//    controller: _controller,
    textInputAction: TextInputAction.next,
    onSubmitted: (String value) async {},

    decoration: InputDecoration(
      hintText: "Search for songs, ..",
      filled: true,
      fillColor: Colors.grey[200],
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        borderSide: BorderSide(color: Color(00000000)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        borderSide: BorderSide(color: Color(00000000)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        borderSide: BorderSide(color: Color(00000000)),
      ),
      prefixIcon: Icon(Icons.search),
      enabled: true,
    ),
    onChanged: (String value) {
//      setState(() {
      if (value.length == 0)
        _searching = false;
      else {
        _searching = true;
        //TODO: should search based on the album, song name, ect
      }
//      });
//      print(_searching);
    },
  );

  @override
  Widget build(BuildContext context) {
    return _searching
        ? SearchResult(
            searchBar: SearchBar(
              autoFocus: true,
              controller: _controllerSearchBar,
              onChangeValue: (String value) => changeState(value),
            ),
          )
        : Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/drawable-xxxhdpi/83957883-cartoon-vector-doodles-music-illustration.png',
                        width: MediaQuery.of(context).size.width,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.ltr,
                            children: <Widget>[
                              Text(
                                "Discover",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                              Text(
                                "Hear it. See it. Live it.",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _searching ? 10 : 0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.025,
                      right: MediaQuery.of(context).size.width * 0.025,
                    ),
                    child: SearchBar(
                      controller: _controller,
                      onChangeValue: (String value) => changeState(value),
                      onTap: () {
                        setState(() {
                          _searching = true;
                        });
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Popular",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                      ),
                      Container(
                        alignment: Alignment(0, 0),
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: <Widget>[
                            Discovery(
                              title: "New Music",
                            ),
                            Discovery(
                              title: "Top By Genre",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Trending",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Genres and moods",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                      ),
                      Container(
                        alignment: Alignment(0, 0),
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          spacing: 10.0, // gap between adjacent chips
                          runSpacing: 10.0, // gap between lines
                          children: <Widget>[
                            Discovery(
                              title: "Chilling",
                            ),
                            Discovery(
                              title: "Top By Genre",
                            ),
                            Discovery(
                              title: "Top By Genre",
                            ),
                            Discovery(
                              title: "Driving",
                            ),
                            Discovery(
                              title: "Evening",
                            ),
                            Discovery(
                              title: "Feeling Good",
                            ),
                            Discovery(
                              title: "New Music",
                            ),
                            Discovery(
                              title: "Feeling Good",
                            ),
                            Discovery(
                              title: "New Music",
                            ),
                            Discovery(
                              title: "Driving",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
