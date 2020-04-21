import 'package:cadenza/AppPages/PublicWidgets/FullWidthViewSong.dart';
import 'package:cadenza/AppPages/PublicWidgets/circularArtistView.dart';
import 'package:cadenza/LoginPages/f_services/auth.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/queue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Auth _auth = Auth();
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'assets/drawable-xxxhdpi/83957883-cartoon-vector-doodles-music-illustration.png',
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Container(
                      child: Positioned(
                          bottom: -55,
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.white,
                          )),
                    ),
                    Container(
                      child: Positioned(
                          bottom: -50,
                          child: CircleAvatar(
                            radius: 75,
                            backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2020/01/31/07/53/cartoon-4807395_960_720.jpg',
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 55,
            ),
            Text("Rami Theeb",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
            Text("@ramitheeb", style: TextStyle(fontSize: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () async {},
                  child: Text("Edit Profile"),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(
                        color: Colors.grey,
                      )),
                ),
                SizedBox(width: 10),
                FlatButton(
                  onPressed: () async {
                    Provider.of<Queue>(context, listen: false).disposePlayer();
                    await _auth.signOut();
                  },
                  child: Text("Sign Out"),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(
                        color: Colors.grey,
                      )),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(
                    "Most Played Songs",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: FullWidthViewSong(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: FullWidthViewSong(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: FullWidthViewSong(),
                ),
              ],
            ),
            FlatButton(
              onPressed: null,
              child: Text("More"),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Colors.grey,
                  )),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(
                    "Followed Artists",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: <Widget>[
                  circularArtistView(
                    artist:
                        Artist(profilePictureURL: "", username: "Rami Theeb"),
                  ),
                  circularArtistView(
                    artist:
                        Artist(profilePictureURL: "", username: "Rami Theeb"),
                  ), circularArtistView(
                    artist:
                        Artist(profilePictureURL: "", username: "Rami Theeb"),
                  ), circularArtistView(
                    artist:
                        Artist(profilePictureURL: "", username: "Rami Theeb"),
                  ), circularArtistView(
                    artist:
                        Artist(profilePictureURL: "", username: "Rami Theeb"),
                  ), circularArtistView(
                    artist:
                        Artist(profilePictureURL: "", username: "Rami Theeb"),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
