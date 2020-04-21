import 'package:cadenza/SizeConfig.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/song.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class MusicGrid extends StatefulWidget {
  final List<Song> musicElements;
  final String title;

  MusicGrid({Key key, this.musicElements, this.title}) : super(key: key);

  @override
  _MusicGridState createState() => _MusicGridState();
}

class _MusicGridState extends State<MusicGrid> {
  Image firstImage;
  bool loadedFirst = false;
  Image secondImage;
  bool loadedSecond = false;
  Image thirdImage;
  bool loadedThird = false;
  Image fourthImage;
  bool loadedFourth = false;
  @override
  Widget build(BuildContext context) {
    if (!loadedFirst) {
      firstImage = Image.asset(
        "assets/AlbumImages/noart.png",
        fit: BoxFit.fill,
      );
      FirebaseStorage.instance
          .ref()
          .child(widget.musicElements[0].albumArtURL)
          .getDownloadURL()
          .then((url) {
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

    if (!loadedSecond) {
      secondImage = Image.asset(
        "assets/AlbumArt/noart.png",
        fit: BoxFit.fill,
      );
      FirebaseStorage.instance
          .ref()
          .child(widget.musicElements[1].albumArtURL)
          .getDownloadURL()
          .then((url) {
        setState(() {
          secondImage = Image.network(
            url,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Image.asset("assets/AlbumImages/noart.png");
            },
          );
          loadedSecond = true;
        });
      });
    }

    if (!loadedThird) {
      thirdImage = Image.asset(
        "assets/AlbumArt/noart.png",
        fit: BoxFit.fill,
      );
      FirebaseStorage.instance
          .ref()
          .child(widget.musicElements[2].albumArtURL)
          .getDownloadURL()
          .then((url) {
        setState(() {
          thirdImage = Image.network(
            url,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Image.asset("assets/AlbumImages/noart.png");
            },
          );
          loadedThird = true;
        });
      });
    }

    if (!loadedFourth) {
      fourthImage = Image.asset(
        "assets/AlbumArt/noart.png",
        fit: BoxFit.fill,
      );
      FirebaseStorage.instance
          .ref()
          .child(widget.musicElements[3].albumArtURL)
          .getDownloadURL()
          .then((url) {
        setState(() {
          fourthImage = Image.network(
            url,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Image.asset("assets/AlbumImages/noart.png");
            },
          );
          loadedFourth = true;
        });
      });
    }

    return SliverPadding(
      padding: EdgeInsets.fromLTRB(
        0,
        SizeConfig.blockSizeVertical * 2.5,
        SizeConfig.blockSizeHorizontal * 2.5,
        SizeConfig.blockSizeVertical * 3,
      ),
      sliver: SliverGrid.count(
        childAspectRatio: 1.1,
        crossAxisCount: 2,
        children: <Widget>[
          Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(14)),
              child: firstImage,
            ),
          ),
          Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(14)),
              child: secondImage,
            ),
          ),
          Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Opacity(
                opacity: 0.8,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(14)),
                  child: thirdImage,
                ),
              ),
              Positioned(
                bottom: SizeConfig.blockSizeVertical * 1.5,
                left: SizeConfig.blockSizeHorizontal * 2,
                child: Text(
                  "${widget.title}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
              child: fourthImage,
            ),
          ),
        ],
      ),
    );
  }
}
