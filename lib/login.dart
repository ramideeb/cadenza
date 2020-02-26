import 'package:assets_audio_player_example/widgets/loginform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' ;


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

    
    return Scaffold(
        body: 
            LoginForm()
             
           );
  }
}
