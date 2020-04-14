import 'package:cadenza/LoginPages/EmailSignUp.dart';
import 'package:cadenza/LoginPages/f_services/auth.dart';
import 'package:cadenza/LoginPages/resetpass.dart';
import 'package:cadenza/LoginPages/verificationPage.dart';
import 'package:cadenza/modules/library.dart';
import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/modules/user.dart';
import 'package:cadenza/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppPages/MainWidget.dart';
import 'LoginPages/forgetPass.dart';
import 'LoginPages/loginpage.dart';
import 'LoginPages/opening.dart';

Future<void> main() {
  runApp(
    MyApp(),
  );
}

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Library>(
          create: (context) => Library(
            user: User("username"),
          ),
        ),
        ChangeNotifierProxyProvider<Library, Queue>(
          create: (_) => Queue(recommenderURL: ""),
          update: (_, lib, queue) {
            queue.library = lib;
            return queue;
          },
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
              StreamProvider<User>.value(value: Auth().user, child: Wrapper()),
          title: 'Flutter Demo',
          theme: applicationtheme(context)),
    );
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
