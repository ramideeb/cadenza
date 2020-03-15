import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _searchBar = TextField(
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
