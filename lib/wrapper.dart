import 'package:cadenza/LoginPages/opening.dart';
import 'package:cadenza/modules/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppPages/MainWidget.dart';
import 'LoginPages/f_services/auth.dart';
import 'modules/library.dart';
import 'modules/queue.dart';

class Wrapper extends StatelessWidget {
  final Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Opening();
    
    } 
    else {
      
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<Library>(
            create: (context) => Library(
              user: User(uid:"username"),
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
        child: HomePage(),
      );
    }
  }
}
