import 'package:assets_audio_player_example/AppPages/MusicPlayer/MusicPlayer.dart';
import 'package:flutter/material.dart';

import 'Profile/Profile.dart';
import 'Search/Search.dart';

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
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Search(),
    MusicPlayer(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          GestureDetector(
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
            child: Container(
              decoration: BoxDecoration(
                color: Color(0XFF1D3557),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 65,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
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
                                builder: (_) =>Scaffold(body: MusicPlayer(),
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: "Music player",
                            transitionOnUserGestures: true,
                            child: Image(
                              image: NetworkImage(
                                  "https://miro.medium.com/max/1200/0*zaNztEcTW01oqBBF.jpg"),
                              fit: BoxFit.cover,
                              height: 50,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Better",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
//                              height: 1,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Free Spirit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
//                              height: 1,
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
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.pause,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  )
                ],
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
