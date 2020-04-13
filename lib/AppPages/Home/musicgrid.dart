import 'package:cadenza/SizeConfig.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:flutter/material.dart';

class MuiscGrid extends StatelessWidget {
  final List<Album> musicElements;
  final String title;

  const MuiscGrid({Key key, this.musicElements, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(
        0,
        SizeConfig.blockSizeVertical * 2.5,
        SizeConfig.blockSizeHorizontal * 2.5,
        SizeConfig.blockSizeVertical * 3,
      ),
      sliver: SliverGrid.count(
        childAspectRatio: 1.1,
        crossAxisCount: 2,
        children: <Widget>[
          Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(14)),
              child: Image.asset(
                "${musicElements[0].albumArtImageUrl}",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(14)),
              child: Image.asset(
                "${musicElements[1].albumArtImageUrl}",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Opacity(
                opacity: 0.8,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(14)),
                  child: Image.asset(
                    "${musicElements[2].albumArtImageUrl}",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                bottom: SizeConfig.blockSizeVertical*1.5,
                left: SizeConfig.blockSizeHorizontal * 2,
                child: Text(
                  "$title",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
              child: Image.asset(
                "${musicElements[3].albumArtImageUrl}",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
