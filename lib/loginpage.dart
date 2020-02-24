import 'package:flutter/material.dart';
import 'SizeConfig.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  bool typing = false;
  SizeConfig sizeConfig = new SizeConfig();

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
    sizeConfig.init(context);
    Widget _logoRow = Container(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 3,
          top: SizeConfig.blockSizeVertical * 4),
      child: Row(
        children: <Widget>[
          Image.asset("logo.png"),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 3,
                bottom: SizeConfig.blockSizeVertical),
            child: Text(
              "Cadenza",
              style: TextStyle(
                fontSize: 25.0,
                color: Color.fromARGB(255, 230, 57, 70),
                fontFamily: "OpenSans",
              ),
            ),
          )
        ],
      ),
    );

    Widget _textRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal * 2,
            bottom: SizeConfig.blockSizeVertical * 9.5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
//            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Dance to the",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 230, 57, 70),
                  fontFamily: "OpenSans",
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Rhythm",
                style: TextStyle(
                    fontSize: 62.0,
                    color: Color.fromARGB(255, 230, 57, 70),
                    height: 1,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Of your heart",
                style: TextStyle(
                  fontSize: 30.0,
                  height: 1,
                  color: Color.fromARGB(255, 230, 57, 70),
                  fontFamily: "OpenSans",
                ),
              ),
            ],
          ),
        ),
        FittedBox(
          child: Image.asset("circle.png"),
          fit: BoxFit.fill,
        )
      ],
    );

    Widget _inputRow = Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 4),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                enabled: true,
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(230, 57, 70, 1))),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(bottom: SizeConfig.blockSizeHorizontal * 4),
            child: TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                enabled: true,
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(230, 57, 70, 1))),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 40,
              height: SizeConfig.blockSizeVertical * 6,
              child: Center(
                child: Text(
                  "Sing in",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            color: Color.fromARGB(255, 230, 57, 70),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1.5),
            child: Text(
              "RESET YOUR PASSWORD >",
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

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _logoRow,
            _textRow,
            _inputRow,
          ],
        ),
      ),
    );
  }
}
