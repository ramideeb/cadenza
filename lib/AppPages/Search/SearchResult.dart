import 'package:assets_audio_player_example/AppPages/PublicWidgets/FullWidthViewSong.dart';
import 'package:assets_audio_player_example/AppPages/Search/SearchBar.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({
    Key key,
    this.searchBar,
  }) : super(key: key);

  final SearchBar searchBar;
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<String> litems = ["1","2","Third","4"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.searchBar,
          ),
          Expanded(
            child: Container(
//          height: MediaQuery.of(context).size.height,
              child: ListView.builder
                (
                  itemCount: litems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children:<Widget>[ new FullWidthViewSong(),Divider()]);
                  }
              ),
            ),
          )
        ],

      ),
    );
  }
}
