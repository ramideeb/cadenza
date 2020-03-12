import 'package:assets_audio_player_example/SizeConfig.dart';
import 'package:assets_audio_player_example/presentation/cutsom_icons_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  static final _sizeTween = Tween<double>(end: 50, begin: 10);
  static final _opacityTween = Tween<double>(end: 0.1, begin: 0.8);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Image.asset(
          "assets/AlbumImages/art15.jpg",
          fit: BoxFit.fill,
          width: _sizeTween.evaluate(animation),
          height: _sizeTween.evaluate(animation),
        ),
      ),
    );
  }
}

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  SizeConfig _sizeConfig = SizeConfig();
  Animation<double> animation;
  Animation<double> heightAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          controller.reverse();
        else if (status == AnimationStatus.dismissed) controller.forward();
      });
    controller.forward();
  }

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

    Widget _playlistArrowDown = IconButton(
      icon: Icon(
        CutsomIcons.chevron_down,
        size: 32,
        color: Colors.black,
      ),
      onPressed: () {
        controller.forward();
      },
    );

    Widget _playlistArrowUp = IconButton(
      icon: Icon(
        CutsomIcons.chevron_up,
        size: 32,
        color: Colors.black,
      ),
      onPressed: () {
        setState(() {
          // _playlistMinimized = false;
        });
      },
    );

    Widget _playlistItemMinimized = Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.3,
            color: Color.fromRGBO(112, 112, 112, 1),
          ),
          borderRadius: BorderRadius.circular(14)),
      height: SizeConfig.blockSizeHorizontal * 25,
      width: SizeConfig.blockSizeHorizontal * 25,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: 1,
            child: Opacity(
              opacity: 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  "assets/AlbumImages/art15.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "Beyond",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
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
          _playlistItemMinimized,
          _playlistItemMinimized,
          _playlistItemMinimized
        ],
      ),
    );

    return AnimatedImage(
      animation: animation,
    );

    // return CustomScrollView(
    //   slivers: <Widget>[
    //     SliverList(
    //       delegate: SliverChildListDelegate(
    //         [
    //           _libraryText,
    //           _playlistText,
    //           _playlistItem,
    //           _playlistArrowDown,
    //           _songsText,
    //           _albumsText,
    //           _genresText,
    //           _artistsText,
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
