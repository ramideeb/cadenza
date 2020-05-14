import 'package:cadenza/modules/playlist.dart';
import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/modules/song.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../SizeConfig.dart';

class PlayListItem extends StatelessWidget {
  final Playlist playlist;
  final Function(Playlist) showPlaylist;
  const PlayListItem({Key key, this.playlist, this.showPlaylist})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //   if(playlist.isSnippet){
        //             playlist.playlistRef.get().then((snapshot){
        //               if(snapshot.exists){
        //                 for(String key in snapshot.data["songs"].keys){
        //                   playlist.playlistSongs.add(
        //                     OnlineSong(
        //                       songID: key,
        //                       url: snapshot.data['songs'][key]["songURL"],
        //                       name: snapshot.data['songs'][key]['songName'],
        //                       album: album,
        //                       albumTitle: album.albumName,
        //                       artistName: album.artistName,
        //                       albumArtURL: album.albumArtImageUrl,
        //                       artistRef: album.artistRef,
        //                       genreName: album.genreName,
        //                     )
        //                   );
        //                 }
        //                 playlist.isSnippet = false;
        //                 showAlbum(album);
        //               }
        //             });
        // }
        // else
        showPlaylist(playlist);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 2,
        ),
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 95,
          height: SizeConfig.blockSizeVertical * 30,
          decoration: BoxDecoration(
            border:
                Border.all(width: 0.5, color: Color.fromRGBO(112, 112, 112, 1)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Opacity(
                opacity: 0.82,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    playlist.imageUrl,
                    fit: BoxFit.fill,
                    width: SizeConfig.blockSizeHorizontal * 80,
                  ),
                ),
              ),
              Positioned(
                left: SizeConfig.blockSizeHorizontal * 8,
                top: SizeConfig.blockSizeVertical * 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "${playlist.playlistName}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2),
                      child: Container(
                        width: 100,
                        child: Text(
                          "${playlist.description}",
                          style: TextStyle(
                            color: Color.fromRGBO(114, 110, 110, 1),
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: SizeConfig.blockSizeHorizontal * 70,
                top: SizeConfig.blockSizeVertical * 18,
                child: IconButton(
                  onPressed: (){
                  Provider.of<Queue>(context,listen: false).buildFromList(playlist.playlistSongs);
                  },
                  icon: Icon(
                    Icons.play_circle_filled,
                    size: 55,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
