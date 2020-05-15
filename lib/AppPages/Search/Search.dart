import 'package:cadenza/AppPages/Home/albumartwidget.dart';
import 'package:cadenza/AppPages/LibrariesPage/SongsList/songitem.dart';
import 'package:cadenza/AppPages/PublicWidgets/FullWidthViewSong.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/library.dart';
import 'package:cadenza/modules/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  List<Song> foundSongs = [];
  bool foundSongsFlag = false;
  List<Album> foundAlbums = [];
  bool foundAlbumsFlag = false;
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

  @override
  Widget build(BuildContext context) {
    List<Song> librarySongs =
        Provider.of<Library>(context, listen: false).songs;
    bool fetchedAlbums =
        Provider.of<Library>(context, listen: false).albumsReady;
    List<Album> libraryAlbums = [];
    if (fetchedAlbums)
      libraryAlbums = Provider.of<Library>(context, listen: false).albums;
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
              child: TextField(
                controller: widget.controller,
                textInputAction: TextInputAction.next,
                onSubmitted: (String value) {
                  setState(() {
                    foundAlbumsFlag = false;
                    foundSongsFlag = false;
                  });
                  foundSongs = librarySongs
                      .where((song) => song.name.contains(value))
                      .toList();
                  foundAlbums = libraryAlbums
                      .where((album) => album.albumName.contains(value))
                      .toList();
                  setState(() {
                    foundAlbumsFlag = true;
                    foundSongsFlag = true;
                  });
                },
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
              firstChild: foundSongsFlag && foundAlbumsFlag
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                      child: Column(
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: foundSongs.length,
                            itemBuilder: (con, i) {
                              return SongItem(
                                song: foundSongs[i],
                                play: null,
                              );
                            },
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (con, i) {
                              return AlbumArtWidget(
                                album: foundAlbums[i],
                              );
                            },
                            itemCount: foundAlbums.length,
                          )
                        ],
                      ))
                  : Center(child: CircularProgressIndicator()),
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
                      "Genres and moods",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ),
                  Container(
                    alignment: Alignment(0, 0),
                    width: MediaQuery.of(context).size.width,
                    // child: FutureBuilder(
                    //   future: Firestore.instance
                    //       .collection("genres")
                    //       .getDocuments(),
                    //   builder: (con, snapshot) {
                    //     if (snapshot.connectionState ==
                    //             ConnectionState.waiting ||
                    //         snapshot.hasError) return Center();
                    //     return ListView.builder(
                    //       shrinkWrap: true,
                    //       itemBuilder: (con, i) => Discovery(
                    //         title: snapshot.data.documents[i].data["name"],
                    //       ),
                    //       itemCount: snapshot.data.documents.length,
                    //     );
                    //   },
                    // ),
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
