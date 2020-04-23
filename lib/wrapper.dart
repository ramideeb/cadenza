import 'package:cadenza/LoginPages/opening.dart';
import 'package:cadenza/LoginPages/welcoming_screen/welcome.dart';
import 'package:cadenza/modules/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppPages/MainWidget.dart';
import 'LoginPages/f_services/auth.dart';
import 'LoginPages/welcoming_screen/welcome.dart';
import 'modules/library.dart';
import 'modules/queue.dart';

class Wrapper extends StatelessWidget {
  final Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    Provider.of<Library>(context).user = user;
    if (user == null) {
      print(1);
      return Opening();
    } else {
      print(2);
      Provider.of<Queue>(context).initializeQueue();
      return FutureBuilder<DocumentSnapshot>(
        future:
            Firestore.instance.collection('libraries').document(user.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Scaffold(
              body: Center(child: Text("Ops")),
            );
          if (snapshot.connectionState == ConnectionState.waiting)
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          if (snapshot.connectionState == ConnectionState.done) {
            Provider.of<Library>(context)
                .initialzieSongsFromOnline(snapshot.data);
            // print(snapshot.data.data['songs']);
          return HomePage();
        }
        }
      );
    }
  }
}
