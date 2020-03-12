import 'package:assets_audio_player_example/AppPages/LibrariesPage/playlistitem.dart';
import 'package:assets_audio_player_example/AppPages/LibrariesPage/playlistitemminimized.dart';
import 'package:assets_audio_player_example/SizeConfig.dart';
import 'package:assets_audio_player_example/modules/playlist.dart';
import 'package:assets_audio_player_example/presentation/cutsom_icons_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List<Playlist> playlistsExample = [
  Playlist(
    imageUrl: "assets/AlbumImages/art15.jpg",
    name: "Beyond",
    description:
        " Enjoy the best music done by artists who are beyond amazeballz",
  ),
  Playlist(
    imageUrl: "assets/AlbumImages/playlist1.jpg",
    name: "Luminate",
    description:
        " Enjoy the best music done by artists who are beyond amazeballz",
  ),
  Playlist(
    imageUrl: "assets/AlbumImages/playlist2.jpg",
    name: "Beatz",
    description:
        " Enjoy the best music done by artists who are beyond amazeballz",
  ),
  Playlist(
    imageUrl: "assets/AlbumImages/playlist3.jpg",
    name: "Hayooo!",
    description:
        " Enjoy the best music done by artists who are beyond amazeballz",
  ),
];

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  SizeConfig _sizeConfig = SizeConfig();

  bool _playlistMinimized = true;
  @override
  Widget build(BuildContext context) {
    _sizeConfig.init(context);

    Widget _libraryText = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 4,
        left: SizeConfig.blockSizeHorizontal * 4,
        bottom: SizeConfig.blockSizeVertical * 3.5,
      ),
      child: Text(
        "Library",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 34,
        ),
      ),
    );

    Widget _playlistText = Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 4,
        bottom: SizeConfig.blockSizeVertical * 2,
      ),
      child: Text(
        "Playlists",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );

    Widget _songsText = Padding(
      padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
      child: Row(
        children: <Widget>[
          Icon(
            CutsomIcons.songs,
            size: 32,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
            child: Text(
              "Songs",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );

    Widget _albumsText = Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 4,
          top: SizeConfig.blockSizeVertical * 3),
      child: Row(
        children: <Widget>[
          Icon(
            CutsomIcons.album,
            size: 32,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
            child: Text(
              "Albums",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );

    Widget _genresText = Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 4,
          top: SizeConfig.blockSizeVertical * 3),
      child: Row(
        children: <Widget>[
          Icon(
            CutsomIcons.genre,
            size: 32,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
            child: Text(
              "Genres",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );

    Widget _artistsText = Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 4,
          top: SizeConfig.blockSizeVertical * 3,
          bottom: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: <Widget>[
          Icon(
            CutsomIcons.microphone,
            size: 32,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
            child: Text(
              "Artists",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );

    Widget _playlistsCarousel = CarouselSlider(
      items: [
        PlayListItem(playlist: playlistsExample[0]),
        PlayListItem(playlist: playlistsExample[1]),
        PlayListItem(playlist: playlistsExample[2]),
        PlayListItem(playlist: playlistsExample[3]),
      ],
      autoPlay: true,
      autoPlayAnimationDuration: Duration(milliseconds: 2000),
      viewportFraction: 1.0,
      height: SizeConfig.blockSizeVertical * 30,
    );
   
    Widget _playlistsGrid = SliverPadding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 3,
          right: SizeConfig.blockSizeHorizontal * 3,
          bottom: SizeConfig.blockSizeVertical * 3),
      sliver: SliverGrid.count(
        crossAxisSpacing: SizeConfig.blockSizeHorizontal * 8,
        mainAxisSpacing: SizeConfig.blockSizeVertical * 3,
        crossAxisCount: 2,
        children: <Widget>[
          PlaylistItemMinimized(playlist: playlistsExample[0]),
          PlaylistItemMinimized(playlist: playlistsExample[1]),
          PlaylistItemMinimized(playlist: playlistsExample[2]),
          PlaylistItemMinimized(playlist: playlistsExample[3]),
        ],
      ),
    );

    Widget _playlistArrow = IconButton(
      icon: Icon(
        _playlistMinimized ? CutsomIcons.chevron_down : CutsomIcons.chevron_up,
        size: 32,
        color: Colors.black,
      ),
      onPressed: () {
        setState(() {
          _playlistMinimized = !(_playlistMinimized);
        });
      },
    );

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _libraryText,
              _playlistText,
            ],
          ),
        ),
        _playlistMinimized
            ? SliverToBoxAdapter(child: _playlistsCarousel)
            : _playlistsGrid,
        SliverList(
          delegate: SliverChildListDelegate([
            _playlistArrow,
            _songsText,
            _albumsText,
            _genresText,
            _artistsText,
          ]),
        ),
      ],
    );
  }
}
