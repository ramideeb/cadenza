import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/modules/song.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../SizeConfig.dart';

class SongItem extends StatelessWidget {
  final Song song;
  final Function(Song song,BuildContext context) play;
  const SongItem({Key key, this.song, this.play}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
          onPressed: (){
            play(song,context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 2.5,
              vertical: SizeConfig.blockSizeVertical * 1.2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Consumer<Queue>(
                        builder:(con,queue,child)=> Text(
                        (song.name.length <= 30)
                              ? song.name
                              : '${song.name.substring(0, 30)}...',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ((queue.currentSong != null)&&(song.songID == queue.currentSong.songID))?Color.fromRGBO(230, 57, 70, 1):Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      song.artistName,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(131, 131, 131, 1),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        );
  }
}
