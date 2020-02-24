import 'package:flutter/material.dart';

class Opening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title:
      Padding(
    padding: EdgeInsets.fromLTRB(0,6,0,0),
    child:   Image.asset('assets/logo.png', fit: BoxFit.cover),
  )


      ,
                     backgroundColor: Colors.transparent,
                     elevation: 0.0, ),
      
    );
  }
}