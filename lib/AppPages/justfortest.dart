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
              String temp = await fileHandler.storeFile(
                  onlineUriString:
                      "https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_5MG.mp3",
                  theFileName: "testingSong6.mp3",
                  theEncryptionKey: "1234");
              print(temp);
            },
          ),
          RaisedButton(
            child: Text("decrypt file"),
            onPressed: () async {
              String temp = await fileHandler.decryptFile(
                  theEncryptedFilePath:
                  "/data/user/0/com.cadenza.Cadenza/app_flutter/testingSong6.mp3.aes",
                  theDecryptedFileName: "testingSong6.mp3",
                  theEncryptionKey: "1234");
              print(temp);
            },
          ),
        ],
      ),
    );
  }
}
