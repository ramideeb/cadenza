import 'package:cadenza/LoginPages/f_services/auth.dart';

import 'login.dart';
import 'widgets/onesideroundedbutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class Opening extends StatelessWidget {
  @override
  final _auth = Auth();
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height * 0.06, 0, 0),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.09,
                      )),
                ]),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        'assets/slogan.png',
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Image.asset(
                        'assets/circle.png',
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.35,
                      ),
                    ]),
                SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.05), // for spacing

                Onesideroundedbutton(
                    color: Color.fromRGBO(29, 53, 87, 1),
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                      size: 25.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    text: Text('Continue using Facebook',
                        style: TextStyle(fontSize: 15)),
                    textcolor: Colors.white,
                    onsbmt: () {
                      _auth.Facebooksignin();
                    }),

                SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.01), // for spacing
                Onesideroundedbutton(
                  color: Color.fromRGBO(245, 245, 245, 0.8),
                  icon: Icon(
                    FontAwesomeIcons.google,
                    color: Color.fromRGBO(230, 57, 70, 1),
                    size: 25.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  text: Text('Continue using Google',
                      style: TextStyle(fontSize: 15)),
                  textcolor: Color.fromRGBO(230, 57, 70, 1),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  Login()),
                        );
                      },
                      child: Text(" Continue using email or signup using email",
                          style: TextStyle(fontSize: 12)),
                    ))
              ],
            )));
  }
}
