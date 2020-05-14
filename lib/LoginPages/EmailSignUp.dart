import 'package:cadenza/LoginPages/f_services/auth.dart';
import 'package:cadenza/LoginPages/welcoming_screen/welcome.dart';
import 'package:flutter/material.dart';

class EmailSignUp extends StatefulWidget {
  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  @override
  final _focusNode = FocusNode();

  final _focusNode2 = FocusNode();

  String Email;
  String Password;
  String CPassword;
 final Auth _auth = Auth();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _pass = TextEditingController();

  final TextEditingController _confirmPass = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
        key: _formKey,
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
//                controller: _usernameController,
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        validator: (val){
                          bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val);
                          if (emailValid == true){
                            return null;
                          }
                          else{
                            return "invalid email";
                          }
                        },
                        onFieldSubmitted: (_) {
                          _focusNode.requestFocus();
                        },
                        onChanged: (val){
                          setState(() {Email=val;});
                        },
                        
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.account_circle),
                        
                          enabled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                           onChanged: (val){
                          setState(() {Password=val;});
                        },
                        focusNode: _focusNode,
                        onFieldSubmitted: (_) {
                          _focusNode2.requestFocus();
                        },
                         controller: _pass,
//                controller: _passwordController,
validator: (val){
                          
                          if (val.length >8){
                            return null;
                          }
                          else{
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _confirmPass,
                        focusNode: _focusNode2,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                           onChanged: (val){
                          setState(() {CPassword=val;});
                        },
//                controller: _passwordController,
validator: (val){
                          
                          if (Password==CPassword){
                            return null;
                          }
                          else{
                            return "passwords do not match ";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.fingerprint),
                          enabled: true,
                        ),
                      ),
                    ),
                    ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.9,
                        child: RaisedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                               dynamic result=await _auth.RegisterWithEmail(Email,Password);

                               if(result!=null)
                               {
                                 Navigator.of(context).popUntil((route) => route.isFirst);

                                   Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => welcome() ),
                                  );

                              
                               }

                              }
                            },
                            focusNode: _focusNode2,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.red)),
                            textColor: Colors.white,
                            color: Color.fromRGBO(230, 57, 70, 1),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text("Sign Up",
                                  style: TextStyle(fontSize: 15)),
                            )))
                  ],
                ),
              )),
            )),
      ),
    ));
  }
}
