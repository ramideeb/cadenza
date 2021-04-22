import 'dart:io';
import 'package:cadenza/LoginPages/f_services/auth.dart';
import 'package:cadenza/LoginPages/welcoming_screen/FavGenres.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class initProfile extends StatefulWidget {
  @override
  _initProfileState createState() => _initProfileState();
}

class _initProfileState extends State<initProfile> {
  Image firstImage;
  String username;
  String firstname;
  String lastname;
  bool disposed = false;
  bool loadedFirst = false;
  File image_file;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid;
  Image pImage;
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://cadenza-db-and-storage.appspot.com');
  StorageUploadTask _uptask;
  final _formKey = GlobalKey<FormState>();

  String inputref = "";
  FirebaseUser user;

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  Future<void> inputData() async {
    this.user = await _auth.currentUser();

    await Firestore.instance
        .collection("users")
        .document(user.uid.toString())
        .get()
        .then((onValue) {
      if (!disposed)
        setState(() {
          inputref = onValue.data['profilePictureURL'];
        });
    });

    // here you write the codes to input the data into firestore
  }

  Future<void> _startUpload() async {
    String x = DateTime.now().toIso8601String();
    String file_path = '/profile_pictures/${x}.png';
    setState(() {
      _uptask = _storage.ref().child(file_path).putFile(image_file);
    });

    await Firestore.instance
        .collection("users")
        .document(this.user.uid.toString())
        .updateData({
      'profilePictureURL': '/profile_pictures/${x}.png',
    });
    if (!disposed)
      setState(() async {
        await inputData();
      });
  }

  @override
  Widget build(BuildContext context) {
    inputData();
    if (!loadedFirst) {
      firstImage = Image.asset(
        "assets/AlbumImages/noart.png",
        fit: BoxFit.fill,
      );

      _storage.ref().child(inputref).getDownloadURL().then((url) {
        setState(() {
          firstImage = Image.network(
            url,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Image.asset("assets/AlbumImages/noart.png");
            },
          );
          loadedFirst = true;
        });
      });
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              await Firestore.instance
                  .collection("users")
                  .document(this.user.uid.toString())
                  .updateData({
                'firstName': firstname,
                'lastName': lastname,
                'username': username
              });

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavGenres()),
              );
            }
          },
          child: Icon(Icons.keyboard_arrow_right),
          backgroundColor: Color.fromRGBO(230, 57, 70, 1),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/qshape.png',
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      _pickImage();
                    },
                    child: CircleAvatar(
                        radius: 75, backgroundImage: firstImage.image),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
//                controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val.length > 4) {
                          return null;
                        } else {
                          return "too short username";
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          username = val;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Username",
                        labelText: "Username",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.account_circle),
                        enabled: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                    child: TextFormField(
                      validator: (val) {
                        if (val.length > 2) {
                          return null;
                        } else {
                          return "too short name";
                        }
                      },
//                controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        setState(() {
                          firstname = val;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "First Name",
                        labelText: "First Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.account_circle),
                        enabled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                    child: TextFormField(
                      validator: (val) {
                        if (val.length > 2) {
                          return null;
                        } else {
                          return "too short name";
                        }
                      },
//                controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        setState(() {
                          lastname = val;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Last Name",
                        labelText: "Last Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.account_circle),
                        enabled: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    File selected = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image_file = selected;
    });

    _cropImage();
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: image_file.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));

    setState(() {
      image_file = cropped ?? image_file;
      firstImage = new Image.file(image_file);
    });

    await _startUpload();
  }

  static Future<void> updateUser(
      String id,
      String firstName,
      String lastName,
      String username,
      String profilePictureURL,
      String favoriteGenreNames) async {
    return await Firestore.instance.collection("users").document(id).setData({
      'profilePictureURL': profilePictureURL,
    });
  }
}
