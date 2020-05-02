import 'package:ansicolor/ansicolor.dart';
import 'package:cadenza/AppPages/MusicPlayer/MusicPlayer.dart';
import 'package:cadenza/AppPages/Home/homepage.dart';
import 'package:cadenza/AppPages/LibrariesPage/library.dart';
import 'package:cadenza/AppPages/MusicPlayer/miniplayer.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/charts.dart';
import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/modules/song.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Charts/chart.dart';
import 'Profile/Profile.dart';
import 'Search/Search.dart';
import 'justfortest.dart';
import 'package:cadenza/AppPages/Album/Album.dart';

final List<Album> exampleAlbums = [
  Album(
    albumName: "ABBA",
    albumArtImageUrl: "assets/AlbumImages/art1.jpg",
    artist: Artist(username: "ABBA"),
  ),
  Album(
    albumName: "Piano Man Album",
    albumArtImageUrl: "assets/AlbumImages/art19.jpg",
    artist: Artist(username: "Billy Joel"),
  ),
  Album(
    albumName: "Sies",
    albumArtImageUrl: "assets/AlbumImages/art20.jpg",
    artist: Artist(username: "Donna"),
  ),
];
final List<Song> songExamples = [
  OnlineSong(
    album: exampleAlbums[1],
    artist: exampleAlbums[1].artist,
    name: "Piano Man",
    url:
        "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_5MG.mp3",
  ),
  OnlineSong(
      album: exampleAlbums[2],
      artist: exampleAlbums[2].artist,
      name: "Mala Fama",
      url:
          "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_5MG.mp3"),
  OnlineSong(
    album: exampleAlbums[0],
    artist: exampleAlbums[0].artist,
    name: "Super Trooper",
    url:
        "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_5MG.mp3",
  ),
];

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions;
  HomePageWidget homePageWidget;
  bool showingAlbum = false;
  Album albumShowing;
  bool showingCharts = false;
  Charts chartsShowing;
  showAlbumCallback(Album album) {
    setState(() {
      showingAlbum = true;
      albumShowing = album;
    });
  }

  hideAlbumCallback() {
    setState(() {
      showingAlbum = false;
    });
  }

  showChartsCallback(Charts charts) {
    setState(() {
      chartsShowing = charts;
      showingCharts = true;
    });
  }

  hideChartsCallback() {
    setState(() {
      showingCharts = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      HomePageWidget(
        showAlbum: showAlbumCallback,
        showCharts: showChartsCallback,
      ),
      Search(),
      Library(),
      ProfilePage(),
      JustForTest(),
    ];
  }

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  // final List<Widget> _widgetOptions = <Widget>[
  //   homePageWidget,
  //   Search(),
  //   Library(),
  //   ProfilePage(),
  //   JustForTest(),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      showingAlbum = false;
      showingCharts = false;
    });
  }

  bool firstBuild = true;
  bool queueEmpty;

  @override
  Widget build(BuildContext context) {
    Widget widgetShowing;
    if (showingAlbum)
      widgetShowing = AlbumWidget(
        album: albumShowing,
        hideAlbum: hideAlbumCallback,
      );
    else if (showingCharts)
      widgetShowing = ChartsWidget(
        hideCharts: hideChartsCallback,
        charts: chartsShowing,
      );
    else
      widgetShowing = _widgetOptions.elementAt(_selectedIndex);
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: widgetShowing,
            ),
          ),
          MiniPlayer(),
        ],
              
      ),
      bottomNavigationBar: Builder(
        builder: (context2) => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              title: Text('EXPLORE'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('SEARCH')),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              title: Text('LIBRARIES'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('PROFILE'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete),
              title: Text('testing'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromRGBO(230, 57, 70, 1),
          onTap: _onItemTapped,
          unselectedItemColor: Color.fromRGBO(130, 130, 130, 1),
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}

//            onHorizontalDragStart: (DragStartDetails dragState) async {
//                            print(dragState);
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => MaterialApp(
//                    home: Scaffold(body: Album()),
//                  ),
//                ),
//              );
//            },
