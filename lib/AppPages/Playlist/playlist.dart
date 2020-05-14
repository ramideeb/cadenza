import 'dart:io';

import 'package:cadenza/AppPages/LibrariesPage/SongsList/songitem.dart';
import 'package:cadenza/AppPages/MainWidget.dart';
import 'package:cadenza/SizeConfig.dart';
import 'package:cadenza/modules/playlist.dart';
import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/modules/song.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<Song> songsExamples = [
  Song(name: "We'll be back", artistName: "Someone", albumTitle: "sdsd"),
  Song(name: "We'll be back", artistName: "Someone", albumTitle: "sdsd"),
  Song(name: "We'll be back", artistName: "Someone", albumTitle: "sdsd"),
  Song(name: "We'll be back", artistName: "Someone", albumTitle: "sdsd"),
  Song(name: "We'll be back", artistName: "Someone", albumTitle: "sdsd"),
  Song(name: "We'll be back", artistName: "Someone", albumTitle: "sdsd"),
  Song(name: "We'll be back", artistName: "Someone", albumTitle: "sdsd"),
  Song(name: "We'll be back", artistName: "Someone", albumTitle: "sdsd"),
  Song(name: "We'll be back", artistName: "Someone", albumTitle: "sdsd"),
  Song(name: "We'll be back", artistName: "Someone", albumTitle: "sdsd"),
  Song(name: "We'll be back", artistName: "Someone", albumTitle: "sdsd"),
];

class PlaylistWidget extends StatelessWidget {
  final Function() hidePlaylist;
  final Playlist playlist;
  const PlaylistWidget({Key key, this.hidePlaylist, this.playlist})
      : super(key: key);

  playPlaylist(Song song,BuildContext context){
    Provider.of<Queue>(context,listen: false).buildFromList(playlist.playlistSongs, song);
  }
  @override
  Widget build(BuildContext context) {
    Widget middlePart = Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Image.asset(
                    playlist.imageUrl,
                    fit: BoxFit.fill,
                    width: SizeConfig.blockSizeHorizontal * 100,
                    height: SizeConfig.blockSizeVertical*31.5,
                  ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  hidePlaylist();
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical * 2,
              horizontal: SizeConfig.blockSizeHorizontal * 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    playlist.playlistName,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 50,
                    child: Text(
                      playlist.description,
                      style: TextStyle(
                        color: Color.fromRGBO(114, 110, 110, 1),
                        fontSize: 12,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              FloatingActionButton(
                backgroundColor: Color.fromRGBO(230, 57, 70, 1),
                child: Icon(
                  Icons.play_arrow,
                  size: 35,
                ),
                elevation: 0,
                onPressed: () {
                  Provider.of<Queue>(context,listen: false).buildFromList(playlist.playlistSongs);
                },
              ),
            ],
          ),
        ),
        // Divider(
        //   // height: SizeConfig.blockSizeVertical*5,
        //   // thickness: SizeConfig.blockSizeVertical*0.5,
        //   color: Colors.black,
        // ),
      ],
    );

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(child: middlePart),
        SliverToBoxAdapter(
            child: SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        )),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (con, i) => SongItem(song: playlist.playlistSongs[i], play: playPlaylist),
            childCount: playlist.playlistSongs.length,
          ),
        ),
      ],
    );
  }
}
