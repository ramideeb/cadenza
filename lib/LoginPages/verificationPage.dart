import 'package:cadenza/LoginPages/resetpass.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    double  cellWidth = ((width*0.9)/4);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      30, MediaQuery.of(context).size.height * 0.1, 0, 0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Forgot\nPassword",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(230, 57, 70, 1),
                            )),
                      )),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/qshape.png',
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/drawable-xxxhdpi/rp2.png',
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
                    child: Text("Please check your email.",
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
                          "We have sent an email with a link to reset your password .",
                          style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
         SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.9,
                child: RaisedButton(
                    onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.red)),
                    textColor: Colors.white,
                    color: Color.fromRGBO(230, 57, 70, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Done", style: TextStyle(fontSize: 15)),
                    ))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ]),
        ),
      ),
    );
  }
}
