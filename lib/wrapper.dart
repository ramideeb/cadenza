import 'package:cadenza/LoginPages/opening.dart';
import 'package:cadenza/modules/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppPages/MainWidget.dart';
import 'LoginPages/f_services/auth.dart';


class Wrapper extends StatelessWidget {
  final Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      print(1);
      return Opening();
    
    } 
    else {
      print(2);
      return HomePage();
    }
  }
}
