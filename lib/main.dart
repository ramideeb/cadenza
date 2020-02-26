import 'package:assets_audio_player_example/verificationPage.dart';
import 'package:flutter/material.dart';

import 'forgetPass.dart';
import 'loginpage.dart';
import 'opening.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ThemeData applicationtheme(BuildContext context) {
    return Theme.of(context).copyWith(
      textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      primaryTextTheme:
          Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      accentTextTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      primaryColor: Color.fromRGBO(230, 57, 70, 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Opening(),
          '/ForgetPass': (context) => Forgetpass(),
          '/VerificationPage': (context) => VerificationPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: applicationtheme(context));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(),
    );
  }
}
