import 'package:flutter/material.dart';

class Discovery extends StatefulWidget {
  const Discovery({
    Key key,
    this.title = "hello",
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  final String title;
  final EdgeInsetsGeometry margin;

  @override
  _DiscoveryState createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => print(MediaQuery
          .of(context)
          .size
          .width),
      onLongPress: () async => print(widget.title),
      child: Container(
        width: 190,
        height: 85,
        margin: widget.margin,
        child: Center(child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19,color: Colors.white),)),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
//            begin: Alignment.le,
//            end: Alignment.bottomRight,
              colors:[Color(0xFFE63946),Color(0xFF1D3557)],
            tileMode: TileMode.clamp, // repeats the gradient over the canvas
          ),
        ),
      ),
    );
  }
}