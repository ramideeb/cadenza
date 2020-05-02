import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/AppPages/Home/genresrow.dart';
import 'package:cadenza/AppPages/Home/musicgrid.dart';
import 'package:cadenza/AppPages/Home/musicrow.dart';
import 'package:cadenza/AppPages/PublicWidgets/circularArtistView.dart';
import 'package:cadenza/SizeConfig.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/charts.dart';
import 'package:cadenza/modules/genre.dart';
import 'package:cadenza/modules/library.dart';
import 'package:cadenza/modules/song.dart';
import 'package:cadenza/modules/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'genreswidget.dart';

final List<Album> albumExamples = [
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art2.jpg",
    artist: Artist(username: "Shosmo"),
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art3.jpg",
    artist: Artist(username: "Shosmo"),
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art6.jpg",
    artist: Artist(username: "Shosmo"),
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art5.jpg",
    artist: Artist(username: "Shosmo"),
  ),
];

final List<Album> gridAlbumExamples = [
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art12.jpg",
    artist: Artist(username: "Shosmo"),
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art7.png",
    artist: Artist(username: "Shosmo"),
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art8.jpg",
    artist: Artist(username: "Shosmo"),
  ),
  Album(
    albumName: "Album",
    albumArtImageUrl: "assets/AlbumImages/art11.jpg",
    artist: Artist(username: "Shosmo"),
  ),
];

final List<Genre> genreExamples = [
  Genre(
    genreName: "Jazz",
    genreImageUrl: "assets/GenresImages/jazz.png",
  ),
  Genre(
    genreName: "Pop",
    genreImageUrl: "assets/GenresImages/pop.png",
  ),
  Genre(
    genreName: "Classic",
    genreImageUrl: "assets/GenresImages/classic.png",
  ),
  Genre(
    genreName: "Rock and Roll",
    genreImageUrl: "assets/GenresImages/rocknroll.jpg",
  ),
];

class HomePageWidget extends StatefulWidget {
  final Function(Album) showAlbum;
  final Function(Charts) showCharts;
  const HomePageWidget(
      {Key key,
      this.showAlbum,
      this.showCharts,})
      : super(key: key);
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  SizeConfig _sizeConfig = SizeConfig();
  Widget topChartsWidget = Center();
  bool loadedCharts = false;
  Widget artistsWidget = Center();
  bool loadedArtists = false;
  Widget genresWidget;
  bool loadedGenres = false;
  Widget _recentlyPlayed = Center();
  Widget _mostPlayed = Center();
  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);

    Widget _exploreText = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical,
        left: SizeConfig.blockSizeHorizontal * 2,
        bottom: SizeConfig.blockSizeVertical * 2.5,
      ),
      child: Text(
        "Explore",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 34,
        ),
      ),
    );

    List<Song> librarySongs = Provider.of<Library>(context,listen: false).songs;

    List<Song> recentlyPlayedList = List<Song>.from(librarySongs);
    recentlyPlayedList.sort((a, b) => a.lastPlayed.compareTo(b.lastPlayed));
    if (recentlyPlayedList.length < 6)
      _recentlyPlayed = Center();
    else
      _recentlyPlayed = DefaultMusicRow(
        showAlbum: widget.showAlbum,
        title: "Jump Back In",
        musicElements: recentlyPlayedList.sublist(0, 6),
      );

    List<Song> mostPlayedList = List<Song>.from(librarySongs);
    mostPlayedList.sort((a, b) => a.timesPlayed.compareTo(b.timesPlayed));
    if (mostPlayedList.length < 6)
      _mostPlayed = Center();
    else
      _mostPlayed = DefaultMusicRow(
        showAlbum: widget.showAlbum,
        title: "Most Played",
        musicElements: mostPlayedList.sublist(0, 6),
      );

    List<Song> chartsList = [];
    if (!loadedCharts) {
      topChartsWidget = SliverToBoxAdapter(child: Center());
      Firestore.instance
          .collection('topCharts')
          .where("name", isEqualTo: "Top 50")
          .getDocuments()
          .then((querySnapshot) {
        DocumentSnapshot topChartDoc = querySnapshot.documents[0];
        if (topChartDoc.exists) {
          String name = topChartDoc.data['name'];
          String imageURL = topChartDoc.data['imageURL'];
          for (String key in topChartDoc.data['songs'].keys) {
            var songMap = topChartDoc.data['songs'][key];
            chartsList.add(OnlineSong(
              songID: key,
              name: songMap['songName'],
              artistName: songMap['artistName'],
              albumTitle: songMap['albumName'],
              url: songMap['songURL'],
              albumRef: songMap['albumRef'],
              artistRef: songMap['artistRef'],
              albumArtURL: songMap['albumArtURL'],
            ));
          }
          Charts charts = Charts(
            name: name,
            imageURL: imageURL,
            songsList: chartsList,
          );

          setState(() {
            topChartsWidget = MusicGrid(
             charts:charts,
             showCharts: widget.showCharts,
            );
            loadedCharts = true;
          });
        }
      });
    }

    List<Artist> artistsList = [];
    if (!loadedArtists) {
      artistsWidget = Center();
      Firestore.instance
          .collection("artists")
          .orderBy("followers", descending: true)
          .limit(6)
          .getDocuments()
          .then((querySnapshot) {
        if (querySnapshot.documents.length > 0) {
          for (DocumentSnapshot artistDoc in querySnapshot.documents) {
            artistsList.add(Artist(
              username: artistDoc.data['username'],
              profilePictureURL: artistDoc.data['profilePictureURL'],
              uid: artistDoc.documentID,
            ));
          }
          setState(() {
            artistsWidget = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 1.5,
                    left: SizeConfig.blockSizeHorizontal * 2,
                    bottom: SizeConfig.blockSizeVertical,
                  ),
                  child: Text(
                    "Popular Artists",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 21,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.blockSizeHorizontal),
                  child: SizedBox(
                    height: SizeConfig.blockSizeVertical * 25,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: artistsList.length,
                      itemBuilder: (con, i) => circularArtistView(
                        artist: artistsList[i],
                      ),
                    ),
                  ),
                ),
              ],
            );

            loadedArtists = true;
          });
        }
      });
    }

    List<Genre> genresList = [];
    if (!loadedGenres) {
      genresWidget = Center();
      List<String> usersGenreNames =
          Provider.of<User>(context,listen: false).favoriteGenreNames;
      Firestore.instance
          .collection("genres")
          .where("name", whereIn: usersGenreNames)
          .getDocuments()
          .then((querySnapshot) {
        if (querySnapshot.documents.length > 0) {
          for (DocumentSnapshot genreDoc in querySnapshot.documents) {
            genresList.add(Genre(
              genreName: genreDoc.data['name'],
              genreImageUrl: genreDoc.data['imageURL'],
              genreID: genreDoc.documentID,
            ));
          }
          setState(() {
            genresWidget = GenresRow(
              genreElements: genresList,
              title: "Genres and Moods",
            );

            loadedGenres = true;
          });
        }
      });
    }

    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _exploreText,
                _recentlyPlayed,
                _mostPlayed,
              ],
            ),
          ),
          topChartsWidget,
          SliverList(
            delegate: SliverChildListDelegate([
              artistsWidget,
              genresWidget,
            ]),
          )
        ],
      ),
    );
  }
}
