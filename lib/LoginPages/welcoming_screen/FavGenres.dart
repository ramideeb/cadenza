import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'grid.dart';

class Item {
  String name;
  Item(this.name);
}

class FavGenres extends StatefulWidget {
  @override
  _FavGenresState createState() => _FavGenresState();
}

class _FavGenresState extends State<FavGenres> {
  List<Item> itemList=List();
  List<Item> selectedList= List();
  List<Item> itemList2=List();

  void initState() {
    loadList();
    super.initState();
  }

  Future<void> loadList() async {

    await Firestore.instance
        .collection("genres")
        .getDocuments()
        .then((snapshot) {
          itemList2.removeRange(0, itemList.length);

      snapshot.documents.forEach((genre) async {
        itemList2.add(Item(genre.data['name']));
      });
    });

    setState(() {
      itemList=itemList2;
    });

  }


  @override
  Widget build(BuildContext context) {
    loadList();
    return SafeArea(
      
      child: Scaffold(

       floatingActionButton: FloatingActionButton(
            onPressed: () async {


            Map<String, bool> map = {};
            selectedList.forEach((f){ map[f.name]=true; });
          
            final FirebaseAuth _auth = FirebaseAuth.instance;
              FirebaseUser user = await _auth.currentUser();

  

                  await Firestore.instance
        .collection("users")
        .document(user.uid.toString())
        .updateData({
          'favoriteGenres':map

    });
    Navigator.of(context).popUntil((route) => route.isFirst);


            },
            child: Icon(Icons.done),
            backgroundColor: Color.fromRGBO(230, 57, 70, 1),
          ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
              itemCount: itemList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return GridItem(
                    item: itemList[index],
                    isSelected: (bool value) {
                      setState(() {
                        if (value) {
                          selectedList.add(itemList[index]);
                        } else {
                          selectedList.remove(itemList[index]);
                        }
                      });
                      print("$index : $value");
                    },
                    key: Key(itemList[index].name.toString()));
              }),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Choose your Favorite Genres ",
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1), fontSize: 18)),
          actions: <Widget>[],
        ),
      ),
    );
  }
}
