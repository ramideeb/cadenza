import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  bool typing = false;
  
  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    // _usernameController.text = "Username";
    // _passwordController.text = "Password";
  }

@override
void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget _logoRow = Container(
      padding: EdgeInsets.only(left: 15, top: 30),
      child: Row(
        children: <Widget>[
          Image.asset("logo.png"),
          Padding(
            padding: EdgeInsets.only(left: 15,bottom:5),
            child: Text(
              "Cadenza",
              style: TextStyle(
                  fontSize: 25.0,
                  color: Color.fromARGB(255, 230, 57, 70),
                  fontFamily: "OpenSans"),
            ),
          )
        ],
      ),
    );

    Widget _textRow = Padding(
      padding: EdgeInsets.only(),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only( left: 10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Dance to The",
                style: TextStyle(
                    fontSize: 36.0,
                    color: Color.fromARGB(255, 230, 57, 70),
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Rythm",
                style: TextStyle(
                    fontSize: 70.0,
                    color: Color.fromRGBO(230, 57, 70, 1),
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Of Your Heart",
                style: TextStyle(
                  fontSize: 36.0,
                  color: Color.fromRGBO(230, 57, 70, 1),
                  fontFamily: "OpenSans",
                ),
              ),
            ],
          ),
          ),
          Expanded(
            child: Image.asset("circle.png"),
          )
        ],
      ),
    );

    Widget _inputRow = Padding(
      padding: EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  decoration: null,
                  // onTap: (){
                  //   setState(() {
                  //     typing = true;
                  //     _usernameController.text = "";
                  //   });
                  // },
                ),
                Divider(
                  color: Color.fromARGB(255, 230, 57, 70),
                  height: 25,
                  thickness: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _passwordController,
                  decoration: null,
                ),
                Divider(
                  color: Color.fromARGB(255, 230, 57, 70),
                  height: 25,
                  thickness: 2,
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              print("Pressed");
            },
            child: Container(
              width: 100,
              height: 40,
              child: Center(
                  child: Text(
                "Sing in",
                style: TextStyle(color: Colors.white),
              )),
            ),
            color: Color.fromARGB(255, 230, 57, 70),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Reset your password >".toUpperCase(),
              style: TextStyle(
                color: Color.fromARGB(255, 230, 57, 70),
                fontFamily: "OpenSans",
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );

    Widget _inputRow2 = Padding(
      padding: EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Username"
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password"
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              print("Pressed");
            },
            child: Container(
              width: 100,
              height: 40,
              child: Center(
                  child: Text(
                "Sing in",
                style: TextStyle(color: Colors.white),
              )),
            ),
            color: Color.fromARGB(255, 230, 57, 70),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Reset your password >".toUpperCase(),
              style: TextStyle(
                color: Color.fromARGB(255, 230, 57, 70),
                fontFamily: "OpenSans",
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.clip,
      children: <Widget>[
        Image.asset("BG.jpg", repeat: ImageRepeat.repeat),
        Container(
            // padding: EdgeInsets.symmetric(vertical: 50),
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _logoRow,
              _textRow,
              _inputRow2,
            ],
          ),
        ))
      ],
    );
  }
}
