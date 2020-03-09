import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key key,
    this.controller,
    this.onChangeValue,
    this.onTap,
    this.autoFocus =false,
  }) : super(key: key);

  final TextEditingController controller;
  final ValueChanged<String> onChangeValue ;
  final GestureTapCallback onTap;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      controller: controller,
      textInputAction: TextInputAction.next,
      onSubmitted: (String value) async {},
      onTap: this.onTap,
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
      onChanged: onChangeValue,
    );
  }
}
