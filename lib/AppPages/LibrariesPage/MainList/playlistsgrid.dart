import 'package:cadenza/AppPages/LibrariesPage/MainList/playlistitemminimized.dart';
import 'package:cadenza/modules/library.dart';
import 'package:cadenza/modules/playlist.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../SizeConfig.dart';

class PlaylistsGrid extends StatelessWidget {
  final List<Playlist> items;
  final Function(Playlist) showPlaylist;
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  PlaylistsGrid({Key key, this.items, this.showPlaylist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget addBox = GestureDetector(
      onTap: () {
        Playlist newPlaylist = Playlist();
        showDialog<void>(
          context: context,
          // barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Add a playlist'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Playlist Name",
                        enabled: true,
                      ),
                    ),
                    TextFormField(
                      controller: descController,
                      decoration: InputDecoration(
                        labelText: "Playlist Description",
                        enabled: true,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        String fileName = await FilePicker.getFilePath();
                        if(fileName!="")
                          newPlaylist.imageUrl = fileName;
                      },
                      child: Text("Playlist Image"),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Create'),
                  onPressed: () {
                    newPlaylist.playlistName = nameController.text;
                    newPlaylist.description = descController.text;
                    Provider.of<Library>(context,listen:false).addPlaylist(newPlaylist);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 0.3,
              color: Color.fromRGBO(112, 112, 112, 1),
            ),
            borderRadius: BorderRadius.circular(14)),
        height: SizeConfig.blockSizeHorizontal * 25,
        width: SizeConfig.blockSizeHorizontal * 25,
        child: Icon(
          Icons.add,
          size: SizeConfig.blockSizeVertical * 10,
        ),
      ),
    );
    return SliverPadding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 3,
          right: SizeConfig.blockSizeHorizontal * 3,
          bottom: SizeConfig.blockSizeVertical * 3),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: SizeConfig.blockSizeHorizontal * 8,
          mainAxisSpacing: SizeConfig.blockSizeVertical * 3,
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (con, i) {
            if (i == items.length) return addBox;
            return PlaylistItemMinimized(
              playlist: items[i],
              showPlaylist: showPlaylist,
            );
          },
          childCount: items.length + 1,
        ),
      ),
    );
  }
}
