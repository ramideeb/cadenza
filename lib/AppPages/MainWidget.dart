import 'package:cadenza/AppPages/MusicPlayer/MusicPlayer.dart';
import 'package:cadenza/AppPages/Home/homepage.dart';
import 'package:cadenza/AppPages/LibrariesPage/library.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/modules/song.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Profile/Profile.dart';
import 'Search/Search.dart';
import 'justfortest.dart';

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

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  final List<Widget> _widgetOptions = <Widget>[
    HomePageWidget(),
    Search(),
    Library(),
    ProfilePage(),
    JustForTest(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool firstBuild = true;
  bool queueEmpty;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    queueEmpty = Provider.of<Queue>(context, listen: false).queue.isEmpty;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
          queueEmpty
              ? Center()
              : GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF1D3557),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 65,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Consumer<Queue>(
                      builder: (context, queue, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => Scaffold(
                                          body: MusicPlayer(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: "Music player",
                                    transitionOnUserGestures: true,
                                    child: Image.asset(
                                      queue.currentSong.album.albumArtImageUrl,
                                      fit: BoxFit.cover,
                                      height: 50,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      queue.currentSong.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.6,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      queue.currentSong.album.albumName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                child: Icon(
                                  queue.state == PlayerState.PAUSED
                                      ? Icons.play_arrow
                                      : Icons.pause,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onTap: () {
                                  print(queue.state);
                                  if (queue.state == PlayerState.PLAYING)
                                    queue.pauseCurrentSong();
                                  else if (queue.state == PlayerState.PAUSED)
                                    queue.playCurrentSong();
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
