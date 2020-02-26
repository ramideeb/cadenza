import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.height * 0.06, 0, 0),
                      child: Column(children: <Widget>[
                        Row(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                              child: Image.asset(
                                'assets/logo.png',
                                fit: BoxFit.contain,
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                              )),
                        ]),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset(
                                'assets/slogan.png',
                                fit: BoxFit.contain,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                              ),
                              Image.asset(
                                'assets/circle.png',
                                fit: BoxFit.contain,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                              ),
                            ]),
                        SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.01), // for spacing
                      ])),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(children: <Widget>[
                        TextFormField(
//                controller: _usernameController,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_focusNode);
                          },
                          decoration: InputDecoration(
                            hintText: "Username",
                            labelText: "Username",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.account_circle),
                            enabled: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          focusNode: _focusNode,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
//                controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.fingerprint),
                            enabled: true,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width * 0.9,
                            child: RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.red)),
                                textColor: Colors.white,
                                color: Color.fromRGBO(230, 57, 70, 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text("Log in",
                                      style: TextStyle(fontSize: 15)),
                                )))
                      ])),
                  SizedBox(height: 10),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/ForgetPass");
                    },
                    child: new Text("Forgot your Password ?" , )
                  )
                ],
              ),
            )));
  }
}
