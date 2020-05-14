import 'package:firebase_auth/firebase_auth.dart';
import 'package:cadenza/modules/user.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  final GoogleSignIn googleSignIn = GoogleSignIn();


  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future RegisterWithEmail(String Email, String Password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: Email, password: Password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<AuthResult> SignInWithEmail(String Email, String Password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: Email, password: Password);
      FirebaseUser user = result.user;
      return result;

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Facebooksignin() async {
    try {
      final facebookLogin = FacebookLogin();
      final FacebookLoginResult facebookLoginResult =
          await facebookLogin.logIn(['email', 'public_profile']);

      FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
      AuthCredential authCredential = FacebookAuthProvider.getCredential(
          accessToken: facebookAccessToken.token);
      FirebaseUser user;
      user = (await _auth.signInWithCredential(authCredential)).user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future GooglSignIn()async{

try{
 final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;
    return _userFromFirebaseUser(user);

  }

catch(e){
  print(e);
}}
}
