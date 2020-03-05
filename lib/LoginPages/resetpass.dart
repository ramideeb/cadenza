import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/ForgotPassheader.dart';

class ResetPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _focusNode = FocusNode();

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
                  'assets/drawable-xxxhdpi/rp3.png',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 0.35,
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
                    child: Text("Enter your new password.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(230, 57, 70, 1),
                            fontSize: 19)),
                  )),
                ],
              ),
            ),
Container(
  height: MediaQuery.of(context).size.height*0.02,
),
             Container(width: MediaQuery.of(context).size.width*0.9,
               child: Form(
                  child: Column(
                children: <Widget>[
                  TextFormField(
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_focusNode);
                    },
                    obscureText: true,
                    textInputAction: TextInputAction.next,

//                controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.fingerprint),
                      enabled: true,
                    ),
                  ),
                  Container(
  height: MediaQuery.of(context).size.height*0.02,
),
                  TextFormField(
                    focusNode: _focusNode,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
//                controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.fingerprint),
                      enabled: true,
                    ),
                  ),
                ],
            )),
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
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.red)),
                    textColor: Colors.white,
                    color: Color.fromRGBO(230, 57, 70, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Done", style: TextStyle(fontSize: 15)),
                    )))
                    ,
          ]),
        ),
      ),
    );
  }
}
