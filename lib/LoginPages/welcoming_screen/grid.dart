import 'package:flutter/material.dart';
import 'FavGenres.dart';


class GridItem extends StatefulWidget {
  final Key key;
  final Item item;
  final ValueChanged<bool> isSelected;

  GridItem({this.item, this.isSelected, this.key});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
     
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Container(
        color: Color.fromRGBO(230, 57, 70, 0.8),
        
              child: Stack(
          
          children: <Widget>[
            Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.item.name, 
              
                 style: TextStyle(
                  
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize:14 )
              
              ),
            )),
            isSelected
                ? Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }
}
