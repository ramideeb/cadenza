import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/ForgotPassheader.dart';

class Forgetpass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            ForgotPassheader(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/FP1.png',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text("Please enter your registered email ID.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(230, 57, 70, 1),
                            fontSize: 19)),
                  )),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                          "We will send a verification code to your regesteresd email ID.",
                          style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Form(
                  child: Column(
                children: <Widget>[
                  TextFormField(
//                controller: _usernameController,
                    textInputAction: TextInputAction.next,

                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.account_circle),
                      enabled: true,
                    ),
                  ),
                ],
              )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.9,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/VerificationPage");
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.red)),
                    textColor: Colors.white,
                    color: Color.fromRGBO(230, 57, 70, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Next", style: TextStyle(fontSize: 15)),
                    )))
          ]),
        ),
      ),
    );
  }
}
