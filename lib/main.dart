import 'package:assets_audio_player_example/LoginPages/resetpass.dart';
import 'package:assets_audio_player_example/LoginPages/verificationPage.dart';
import 'package:flutter/material.dart';
import 'AppPages/MainWidget.dart';
import 'LoginPages/forgetPass.dart';
import 'LoginPages/loginpage.dart';


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
          '/': (context) => HomePage(),
          '/ForgetPass': (context) => Forgetpass(),
          '/VerificationPage': (context) => VerificationPage(),
          '/ResetPass': (context) => ResetPass(),
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