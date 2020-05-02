import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/modules/song.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MusicPlayer.dart';

class MiniPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Queue>(
        child: Selector<Queue, Song>(
          selector: (con, queue) => queue.currentSong,
          builder: (con, currentSong, child) => Hero(
            tag: "Music player",
            transitionOnUserGestures: true,
            child: FutureBuilder<dynamic>(
              future: FirebaseStorage.instance
                  .ref()
                  .child(currentSong.albumArtURL)
                  .getDownloadURL(),
              builder: (con, url) {
                if (url.connectionState == ConnectionState.waiting ||
                    url.hasError)
                  return Image.asset(
                    "assets/AlbumImages/noart.png",
                    fit: BoxFit.cover,
                    height: 50,
                  );
                return Image.network(
                  url.data,
                  fit: BoxFit.cover,
                  height: 50,
                );
              },
            ),
          ),
        ),
        builder: (con, queue, child) {
          if (queue.queue.isEmpty) return Center();

          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0XFF1D3557),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 65,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                      children: <Widget>[
                        ClipOval(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Scaffold(
                                    body: MusicPlayer(),
                                  ),
                                ),
                              );
                            },
                            child: child,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                (queue.currentSong.name.length <= 20)
                              ? queue.currentSong.name
                              : '${queue.currentSong.name.substring(0, 20)}...',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                queue.currentSong.albumTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        child: Icon(
                          queue.state == PlayerState.PAUSED
                              ? Icons.play_arrow
                              : Icons.pause,
                          color: Colors.white,
                          size: 30,
                        ),
                        onTap: () {
                          print(queue.state);
                          if (queue.state == PlayerState.PLAYING)
                            queue.pauseCurrentSong();
                          else if (queue.state == PlayerState.PAUSED)
                            queue.playCurrentSong();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
