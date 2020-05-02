import 'package:cadenza/AppPages/LibrariesPage/SongsList/songitem.dart';
import 'package:cadenza/modules/charts.dart';
import 'package:cadenza/modules/queue.dart';
import 'package:cadenza/modules/song.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../SizeConfig.dart';

class ChartsWidget extends StatelessWidget {
  final Charts charts;
  final Function() hideCharts;
playCharts(Song song,BuildContext context){
    Provider.of<Queue>(context,listen: false).buildFromList(charts.songsList, song);
  }
  const ChartsWidget({Key key, this.charts, this.hideCharts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.width,
                    // width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset:
                                  Offset(0.0, SizeConfig.blockSizeVertical * 2),
                              blurRadius: 2.0)
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom:Radius.circular(30),
                      ),
                      child: FutureBuilder(
                        future: FirebaseStorage.instance
                            .ref()
                            .child(charts.imageURL)
                            .getDownloadURL(),
                        builder: (con, url) {
                          if (url.connectionState == ConnectionState.waiting ||
                              url.hasError)
                            return Center(
                              child: Image.asset(
                                "assets/AlbumImages/noart.png",
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            );
                          return Image(
                            // width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.width,
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
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      hideCharts();
                    },
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                     child: Padding(
                        padding: EdgeInsets.only(
                            bottom: SizeConfig.safeBlockVertical),
                        child: Text(
                          (charts.name.length <= 14)
                              ? charts.name
                              : '${charts.name.substring(0, 14)}...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                            height: 0,
                          ),
                        ),
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
                        Provider.of<Queue>(context,listen: false).buildFromList(charts.songsList);
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
              (con, i) => SongItem(song: charts.songsList[i],play: playCharts),
              childCount: charts.songsList.length,
            ),
          ),
        ],
      ),
    );
  }
}
