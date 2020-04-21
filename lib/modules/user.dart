import 'package:cadenza/modules/genre.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  //TODO:to be implemented
  final String uid;
  String username;
  String firstName;
  String lastName;
  String profilePictureURL;
  List<Genre> favoriteGenres;
  List<String> favoriteGenreNames=[];
  User({this.uid, this.username,this.profilePictureURL,this.firstName,this.lastName}){
    initailizeUserProfile(uid);
  }
//  User({this.uid,this.username});

  Future<void> initailizeUserProfile(String id) async {
    DocumentSnapshot userDoc = await Firestore.instance.collection("users").document(id).get();
    this.username = userDoc.data['username'];
    this.firstName = userDoc.data['firstName'];
    this.lastName = userDoc.data['lastName'];
    this.profilePictureURL = userDoc.data['profilePictureURL'];
    for(String key in userDoc.data['favoriteGenres'].keys)
      this.favoriteGenreNames.add(key);
  }
}