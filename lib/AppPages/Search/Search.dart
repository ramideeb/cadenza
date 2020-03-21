import 'package:assets_audio_player_example/AppPages/Home/musicrow.dart';
import 'package:assets_audio_player_example/AppPages/PublicWidgets/FullWidthViewSong.dart';
import 'package:assets_audio_player_example/modules/Album.dart';
import 'package:flutter/material.dart';
import 'DiscoveryWidget.dart';

class Search extends StatefulWidget {
  TextEditingController _controller;
  TextEditingController _controllerSearchBar;

  TextEditingController get controller => _controller;

  set controller(TextEditingController value) {
    _controller = value;
  }

  @override
  _SearchState createState() => _SearchState();

  TextEditingController get controllerSearchBar => _controllerSearchBar;

  set controllerSearchBar(TextEditingController value) {
    _controllerSearchBar = value;
  }
}

class _SearchState extends State<Search> {
  static bool _searching = false;
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
  final List<Album> albumExamples = [
    Album(
      albumName: "Album",
      albumArtImageUrl: "assets/AlbumImages/art2.jpg",
      artistName: "Shosmo",
    ),
    Album(
      albumName: "Album",
      albumArtImageUrl: "assets/AlbumImages/art3.jpg",
      artistName: "Shosmo",
    ),
    Album(
      albumName: "Album",
      albumArtImageUrl: "assets/AlbumImages/art6.jpg",
      artistName: "Shosmo",
    ),
    Album(
      albumName: "Album",
      albumArtImageUrl: "assets/AlbumImages/art5.jpg",
      artistName: "Shosmo",
    ),
  ];

  void initState() {
    super.initState();
    widget.controllerSearchBar = TextEditingController();
    widget.controller = TextEditingController();
  }

  void dispose() {
    widget.controllerSearchBar.dispose();
    widget.controller.dispose();

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
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AnimatedCrossFade(
              duration: Duration(milliseconds: 200),
              reverseDuration: Duration(milliseconds: 200),
              crossFadeState: _searching
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/drawable-xxxhdpi/83957883-cartoon-vector-doodles-music-illustration.png',
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8),
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
                              fontWeight: FontWeight.normal, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              secondChild: SafeArea(
                child: SizedBox(height: 5),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.025),
              child:
              TextField(
                controller: widget.controller,
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
                onChanged: changeState,
              ),
            ),
            AnimatedCrossFade(
              duration: Duration(milliseconds: 200),
              reverseDuration: Duration(milliseconds: 200),
              crossFadeState: _searching
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: litems.asMap().entries.map((MapEntry map) {
                    return Column(children: [FullWidthViewSong(), Divider()]);
                  }).toList(),
                ),
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Popular",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ),
                  DefaultMusicRow(
                    title: "Recently Played",
                    musicElements: albumExamples,
                  ),
//                  SingleChildScrollView(
//                    scrollDirection: Axis.horizontal,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        //TODO: from HomePageForRealz branch
//                      ],
//                    ),
//                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Genres and moods",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
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
            ),
          ],
        ),
      ),
    );
  }
}
