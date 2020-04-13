
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cadenza/modules/user.dart';


class Auth{

  final FirebaseAuth _auth = FirebaseAuth.instance;


Future signOut() async {
try{
  return await _auth.signOut();

}catch(e){
print (e.toString());
return null;
}

}

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null? User(uid:user.uid):null;


  }

  Stream<User>  get user{
    return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
  }


  Future  RegisterWithEmail(String Email , String Password) async {
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: Email, password: Password);
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);

    }catch(e){
print(e.toString());
return null;
    }

  }




  
  Future SignInWithEmail(String Email , String Password) async {
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: Email, password: Password);
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);

    }catch(e){
print(e.toString());
return null;
    }

  }
}