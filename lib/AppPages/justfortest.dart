import 'dart:io';

import 'package:cadenza/modules/FileHandler.dart';
import 'package:flutter/material.dart';

class JustForTest extends StatefulWidget {
  @override
  _JustForTestState createState() => _JustForTestState();
}

class _JustForTestState extends State<JustForTest> {
  FileHandler fileHandler = new FileHandler();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("store file"),
            onPressed: () async {
              fileHandler.storeFile(
                  onlineUriString:
                      "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_5MG.mp3",
                  theFileName: "testingSong7.mp3",
                  theEncryptionKey: "1234").then((String temp)=> print(temp));
            },
          ),
          RaisedButton(
            child: Text("decrypt file"),
            onPressed: () async {
               fileHandler.decryptFile(
                  theEncryptedFilePath:
                  "/data/user/0/com.cadenza.Cadenza/app_flutter/testingSong7.mp3.aes",
                  theDecryptedFileName: "testingSong7.mp3",
                  theEncryptionKey: "1234").then((String temp)=>print(temp));
            },
          ),
          RaisedButton(
            child: Text("delete file aes"),
            onPressed: () async {
              fileHandler.deleteFile(theFilePath: "/data/user/0/com.cadenza.Cadenza/app_flutter/testingSong7.mp3.aes");
            },
          ),
          RaisedButton(
            child: Text("delete file cache"),
            onPressed: () async {
              fileHandler.deleteFile(theFilePath: "/data/user/0/com.cadenza.Cadenza/cache/testingSong7.mp3");
            },
          ),
          RaisedButton(
            child: Text("see files cache"),
            onPressed: () async {
              Directory("/data/user/0/com.cadenza.Cadenza/cache/").list().forEach((FileSystemEntity f){
                print(f.toString());
              });
            },
          ),
          RaisedButton(
            child: Text("see files system"),
            onPressed: () async {
              Directory("/data/user/0/com.cadenza.Cadenza/app_flutter/").list().forEach((FileSystemEntity f){
                print(f.toString());
              });
            },
          ),
        ],
      ),
    );
  }
}
