import 'dart:ui';

import 'package:cadenza/SizeConfig.dart';
import 'package:cadenza/modules/queue.dart';
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

class MusicPlayer extends StatefulWidget {
  final double musicDuration = 100;

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double timestamp = 0;
  final SizeConfig _sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context) {
    print(SizeConfig.screenHeight);
    IconData repeatIcon;
    RepeatState repeatState = Provider.of<Queue>(context).repeat;
    if (repeatState == RepeatState.LOOP || repeatState == RepeatState.NONE)
      repeatIcon = Icons.repeat;
    else
      repeatIcon = Icons.repeat_one;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
            // top: 10,
            ),
        child: Consumer<Queue>(
          builder: (con, queue, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
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
              SizedBox(height: SizeConfig.blockSizeVertical * 3,),
              Column(
                children: <Widget>[
                  Container(
                    height: SizeConfig.blockSizeVertical*40,
                    width: SizeConfig.blockSizeVertical*40,
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
                        //TODO: change to network image when database is connected
                        child: Image.asset(
                          queue.currentSong.album.albumArtImageUrl,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        // child: Image(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: MediaQuery.of(context).size.width,
                        //   image: NetworkImage(
                        //     "https://images-na.ssl-images-amazon.com/images/I/91zZQ3p3HEL._SL1500_.jpg",
                        //   ),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical*1.24),
                  Text(
                    queue.currentSong.name,
                    style: TextStyle(
                        height: 1,
                        color: Color(0XFF1D3557),
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6),
                  ),
                  Text(
                    queue.currentSong.album.albumName,
                    style: TextStyle(
                        color: Color(0XFF1D3557),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*3.5, horizontal: 10),
                child: Column(
                  children: <Widget>[
                    Slider(
                      value: (queue.position.inMilliseconds<queue.duration.inMilliseconds)?queue.position.inMilliseconds.toDouble():0,
                      onChanged: (double value) {
                        print("value is $value");
                        // setState(() {
                        //   timestamp=value;
                        // });
                        setState(() {
                          queue.player
                              .seek(Duration(milliseconds: value.round()));
                        });
                      },
                      min: 0.0,
                      max: queue.duration?.inMilliseconds?.toDouble() ?? 100,
                      inactiveColor: Color(0x5F1D3557),
                      activeColor: Color(0XFFE63946),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(timestampFormat(queue.position)),
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
                            setState(() {
                              if (queue.shuffle == true) {
                                queue.shuffle = false;
                              } else {
                                queue.shuffle = true;
                              }
                            });
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
                                    queue.playCurrentSong();
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
                            repeatIcon,
                          ),
                          onPressed: () {
                            setState(() {
                              if (repeatState == RepeatState.NONE) {
                                queue.repeat = RepeatState.ONCE;
                                queue.repeatOnce(true);
                              } else if (repeatState == RepeatState.ONCE) {
                                queue.repeat = RepeatState.LOOP;
                                queue.repeatOnce(false);
                              } else
                                queue.repeat = RepeatState.NONE;
                            });
                          },
                          color: (repeatState == RepeatState.ONCE ||
                                  repeatState == RepeatState.LOOP)
                              ? const Color(0XFFE63946)
                              : const Color(0XCC1D3557),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
