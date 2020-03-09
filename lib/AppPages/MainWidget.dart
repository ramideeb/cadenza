import 'package:assets_audio_player_example/AppPages/Album/Album.dart';
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
    Album(),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
