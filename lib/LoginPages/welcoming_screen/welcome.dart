import 'package:cadenza/LoginPages/welcoming_screen/initProfile.dart';
import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
      onPressed: () {
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => initProfile()),
  );
      },
      child: Icon(Icons.keyboard_arrow_right
),
      backgroundColor:  Color.fromRGBO(230, 57, 70, 1),
    ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Image.asset(
                    'assets/drawable-xxxhdpi/Group 55.png',
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.width * 0.5,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text("Welcome To Cadenza !!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(230, 57, 70, 1),
                      fontSize: 25)),
                      
            ],
          ),
        ),
      ),
    );
  }
}
