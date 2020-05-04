import 'package:cadenza/modules/library.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../SizeConfig.dart';

class SearchBar extends StatelessWidget {
  final Function(String) search;
  const SearchBar({Key key, this.search}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _searchBar = TextField(
      onChanged: (s){
        search(s);
      },
      enabled: true,
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 5,
        ),
      ),
    );

    return SliverAppBar(
      title: _searchBar,
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: SizeConfig.blockSizeVertical * 5,
    );
  }
}
