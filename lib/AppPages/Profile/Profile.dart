import 'package:cadenza/AppPages/PublicWidgets/FullWidthViewSong.dart';
import 'package:cadenza/AppPages/PublicWidgets/circularArtistView.dart';
import 'package:cadenza/LoginPages/f_services/auth.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/library.dart';
import 'package:cadenza/modules/queue.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
class ProfilePage extends StatelessWidget {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://cadenza-db-and-storage.appspot.com');

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
                    Provider.of<Library>(context,listen: false).disposeLibrary();
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
                  child: Container(
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        
        Row(children: <Widget>[ Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8.0, 0),
            child: Text(
              " ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey[700]),
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                'https://images.shazam.com/coverart/t331794618-i1166702299_s400.jpg',
                width: 65,
              )),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Sweet Hallelujah",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              Text(
                "Tom Grennan",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[500]),
              ),
            ],
          ),],),
         
          Align( 
          
            child: PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Like"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Dislike"),
                ),
              ],
            ),
          )
        ],
      ),
    ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child:Container(
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        
        Row(children: <Widget>[ Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8.0, 0),
            child: Text(
              " ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey[700]),
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                'https://i.pinimg.com/originals/06/e3/95/06e39584a4d0ccd3b3fd1b840d0d12b8.jpg',
                width: 65,
                height: 65,
              )),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Bad Romance",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              Text(
                "Lady Gaga",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[500]),
              ),
            ],
          ),],),
         
          Align( 
          
            child: PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("First"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Second"),
                ),
              ],
            ),
          )
        ],
      ),
    ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        
        Row(children: <Widget>[ Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8.0, 0),
            child: Text(
              " ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey[700]),
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                'https://i.pinimg.com/originals/06/e3/95/06e39584a4d0ccd3b3fd1b840d0d12b8.jpg',
                width: 65,
                height:65,
              )),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Shallow",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              Text(
                "Lady Gaga",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[500]),
              ),
            ],
          ),],),
         
          Align( 
          
            child: PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("First"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Second"),
                ),
              ],
            ),
          )
        ],
      ),
    ),
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
