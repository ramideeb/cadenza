import 'dart:ui';

import 'package:ansicolor/ansicolor.dart';
import 'package:cadenza/SizeConfig.dart';
import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/modules/song.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String timestampFormat(Duration d) {
  String seconds;
  String minutes = "${d.inMinutes.remainder(60)}";
  if (d.inSeconds.remainder(60) < 10)
    seconds = "0${d.inSeconds.remainder(60)}";
  else
    seconds = "${d.inSeconds.remainder(60)}";
  return "$minutes:$seconds";
}

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AnsiPen pen = AnsiPen()..rgb(r: 1.0, g: 0, b: 0);
    print(pen("rebuilt music player"));
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
            // top: 10,
            ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Selector<Queue,Song>(
                builder: (con,song,child)=>Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "PLAY LIST",
                          style: TextStyle(
                            height: 1,
                            color: Color(0XFF1D3557),
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Raleway",
                          ),
                        ),
                        Text(
                          "Likes Songs",
                          style: TextStyle(
                            color: Color(0XFF1D3557),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Raleway",
                            letterSpacing: 0.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.playlist_play),
                    onPressed: () {},
                  ),
                ],
              ),
                selector: (con,queue)=>queue.currentSong,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3,
              ),
              Selector<Queue,Song>(
                builder: (con,song,child)=>Column(
                children: <Widget>[
                  Container(
                    height: SizeConfig.blockSizeVertical * 40,
                    width: SizeConfig.blockSizeVertical * 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0)
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: "Music player",
                        child: FutureBuilder<dynamic>(
                          future: FirebaseStorage.instance
                              .ref()
                              .child(song.albumArtURL)
                              .getDownloadURL(),
                          builder: (context, url) {
                            if (url.connectionState ==
                                    ConnectionState.waiting ||
                                url.hasError)
                              return Image.asset(
                                "assets/AlbumImages/noart.png",
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              );
                            return Image.network(
                              url.data,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 1.24),
                  Text(
                   (song.name.length <= 15)
                              ? song.name
                              : '${song.name.substring(0, 15)}...',
                    style: TextStyle(
                        height: 1,
                        color: Color(0XFF1D3557),
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6),
                  ),
                  Text(
                    song.albumTitle,
                    style: TextStyle(
                        color: Color(0XFF1D3557),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6),
                  ),
                ],
              ),
                selector: (con,queue)=>queue.currentSong,
              ),
              Consumer<Queue>(
                builder: (con,queue,child)=>Container(
                margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 3.5,
                    horizontal: 10),
                child: Column(
                  children: <Widget>[
                    StreamBuilder<Duration>(
                        initialData: Duration(milliseconds: 0),
                        stream: queue.positionStream,
                        builder: (con, p) {
                          if (p.hasError) {
                            AnsiPen pen = AnsiPen()..rgb(r: 1.0, g: 0, b: 1.0);
                            print(
                                pen("position stream has an error ${p.error}"));
                          }
                          return Slider(

                            value: (p.data != null &&
                                    p.data.inMilliseconds <
                                        queue.duration.inMilliseconds)
                                ? p.data.inMilliseconds.toDouble()
                                : 0,
                            onChanged: (double value) {
                              queue.player
                                  .seek(Duration(milliseconds: value.round()));
                            },
                            min: 0.0,
                            max: queue.duration?.inMilliseconds?.toDouble() ??
                                100,
                            inactiveColor: Color(0x5F1D3557),
                            activeColor: Color(0XFFE63946),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          StreamBuilder(
                              stream: queue.positionStream,
                              builder: (con, p) => Text(timestampFormat(
                                  (p.data!=null && queue.state != PlayerState.LOADING) ?p.data :Duration(milliseconds: 0)))),
                          Text(timestampFormat(queue.duration)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.shuffle,
                          ),
                          onPressed: () {
                            if (queue.shuffle == true) {
                              queue.shuffle = false;
                            } else {
                              queue.shuffle = true;
                            }
                          },
                          color: queue.shuffle
                              ? const Color(0XFFE63946)
                              : const Color(0XCC1D3557),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.skip_previous,
                                size: 45,
                              ),
                              padding: new EdgeInsets.all(0.0),
                              onPressed: () {
                                queue.previousSong();
                              },
                              color: Color(0XCC1D3557),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.0)
                                  ]),
                              child: FloatingActionButton(
                                backgroundColor: Color.fromRGBO(230, 57, 70, 1),
                                child: Icon(
                                  queue.state == PlayerState.PAUSED
                                      ? Icons.play_arrow
                                      : Icons.pause,
                                  size: 45,
                                ),
                                elevation: 0,
                                onPressed: () {
                                  if (queue.state == PlayerState.PAUSED)
                                    queue.resumeCurrentSong();
                                  else if (queue.state == PlayerState.PLAYING)
                                    queue.pauseCurrentSong();
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.skip_next,
                                size: 45,
                              ),
                              padding: new EdgeInsets.all(0.0),
                              onPressed: () {
                                queue.nextSong();
                              },
                              color: Color(0XCC1D3557),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            (queue.repeat == RepeatState.LOOP || queue.repeat == RepeatState.NONE)?Icons.repeat:Icons.repeat_one
                          ),
                          onPressed: () {
                            if (queue.repeat == RepeatState.NONE) {
                              queue.repeat = RepeatState.ONCE;
                              queue.repeatOnce(true);
                            } else if (queue.repeat== RepeatState.ONCE) {
                              queue.repeat = RepeatState.LOOP;
                              queue.repeatOnce(false);
                            } else
                              queue.repeat = RepeatState.NONE;
                          },
                          color: (queue.repeat == RepeatState.ONCE ||
                                  queue.repeat == RepeatState.LOOP)
                              ? const Color(0XFFE63946)
                              : const Color(0XCC1D3557),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),
        
      ),
    );
  }
}

