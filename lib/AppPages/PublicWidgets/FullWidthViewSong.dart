import 'package:flutter/material.dart';

class FullWidthViewSong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        
        Row(children: <Widget>[ Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8.0, 0),
            child: Text(
              "1",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey[700]),
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                'https://picsum.photos/250?image=9',
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
                "rami theeb",
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
    );
  }
}
