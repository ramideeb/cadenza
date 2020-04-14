
import 'package:cadenza/LoginPages/EmailSignUp.dart';
import 'package:cadenza/LoginPages/f_services/auth.dart';
import 'package:flutter/material.dart';

import '../forgetPass.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _focusNode = FocusNode();

  String Email;
  String err = "";
  final Auth _auth = Auth();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _pass = TextEditingController();

  String Password;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
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
                        ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width * 0.9,
                            child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(context,   MaterialPageRoute(builder: (context) => EmailSignUp()));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.red)),
                                textColor: Colors.white,
                                color: Color.fromRGBO(230, 57, 70, 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text("Sign Up",
                                      style: TextStyle(fontSize: 15)),
                                ))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('or'),
                        ),
                        TextFormField(
//                controller: _usernameController,
                          textInputAction: TextInputAction.next,
                          autofocus: true,
                          validator: (val) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val);
                            if (emailValid == true) {
                              return null;
                            } else {
                              return "invalid email";
                            }
                          },
                          onFieldSubmitted: (_) {
                            _focusNode.requestFocus();
                          },
                          onChanged: (val) {
                            setState(() {
                              Email = val;
                            });
                          },

                          decoration: InputDecoration(
                            hintText: "Email",
                            labelText: "Email",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.account_circle),
                            enabled: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          onChanged: (val) {
                            setState(() {
                              Password = val;
                            });
                          },
                          focusNode: _focusNode,

                          controller: _pass,
//                controller: _passwordController,
                          validator: (val) {
                            if (val.length > 8) {
                              return null;
                            } else {
                              return "your password has to be at least 8 digits  ";
                            }
                          },
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
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    dynamic result =
                                        await _auth.SignInWithEmail(
                                            Email, Password);

                                    if (result == null) {
                                      setState(() {
                                        err = "login Failed";
                                      });
                                    } else {
                                    Navigator.pop(context);
                                    }
                                  }
                                },
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
                  Text(err),
                  new GestureDetector(
                      onTap: () {
                        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Forgetpass()),
  );
                      },
                      child: new Text(
                        "Forgot your Password ?",
                      ))
                ],
              ),
            )));
  }
}
