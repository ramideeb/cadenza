import 'package:cadenza/AppPages/LibrariesPage/SongsList/songitem.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/modules/song.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../SizeConfig.dart';

class AlbumWidget extends StatelessWidget {
  final Album album;
  final Function() hideAlbum;

  playAlbum(Song song, BuildContext context) {
    Provider.of<Queue>(context, listen: false)
        .buildFromList(album.albumSongs, song);
  }

  const AlbumWidget({Key key, this.album, this.hideAlbum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
//                 width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                    child: Hero(
                      tag: "album",
                      transitionOnUserGestures: true,
                      child: FutureBuilder(
                        future: FirebaseStorage.instance
                            .ref()
                            .child(album.albumArtImageUrl)
                            .getDownloadURL(),
                        builder: (con, url) {
                          if (url.connectionState == ConnectionState.waiting ||
                              url.hasError)
                            return Image.asset(
                              "assets/AlbumImages/noart.png",
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          return Image(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width,
                            image: NetworkImage(
                              url.data,
                            ),
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          hideAlbum();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.star),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: SizeConfig.safeBlockVertical),
                        child: Text(
                          (album.albumName.length <= 14)
                              ? album.albumName
                              : '${album.albumName.substring(0, 14)}...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                            height: 0,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.album,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            album.artistName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: -20,
                  child: Container(
                    height: 60,
                    width: 60,
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
                        Icons.play_arrow,
                        size: 35,
                      ),
                      elevation: 0,
                      onPressed: () {
                        Provider.of<Queue>(context, listen: false)
                            .buildFromList(album.albumSongs);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (con, i) => SongItem(song: album.albumSongs[i], play: playAlbum),
              childCount: album.albumSongs.length,
            ),
          ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   // crossAxisAlignment: CrossAxisAlignment.start,
          //   itemCount: album.albumSongs.length,
          //   itemBuilder: (con, i) => SongItem(song: album.albumSongs[i]),
          //   // children: litems.asMap().entries.map((MapEntry map) {
          //   //   return Column(
          //   //     children: <Widget>[
          //   //       Divider(),
          //   //       Row(
          //   //         crossAxisAlignment: CrossAxisAlignment.start,
          //   //         children: <Widget>[
          //   //           Padding(
          //   //             padding: EdgeInsets.only(top: 6, right: 5, left: 5),
          //   //             child: Icon(
          //   //               Icons.audiotrack,
          //   //               color: Color.fromRGBO(230, 57, 70, 1),
          //   //             ),
          //   //           ),
          //   //           Expanded(
          //   //             child: Column(
          //   //               crossAxisAlignment: CrossAxisAlignment.start,
          //   //               children: <Widget>[
          //   //                 Text(
          //   //                   litems[map.key],
          //   //                   style: TextStyle(
          //   //                       color: Color(0xff1D3557),
          //   //                       fontSize: 20,
          //   //                       fontWeight: FontWeight.w600,
          //   //                       letterSpacing: 0.6),
          //   //                 ),
          //   //                 Text(
          //   //                   "Khalid",
          //   //                   style: TextStyle(
          //   //                       color: Color(0xC01D3557),
          //   //                       fontSize: 12,
          //   //                       fontWeight: FontWeight.w600,
          //   //                       letterSpacing: 0.6),
          //   //                 ),
          //   //               ],
          //   //             ),
          //   //           )
          //   //         ],
          //   //       ),
          //   //     ],
          //   //   );
          //   // }).toList(),
          // ),
        ],
      ),
    );
  }
}
