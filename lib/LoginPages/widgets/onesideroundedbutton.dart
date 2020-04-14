import 'package:flutter/material.dart';

class Onesideroundedbutton extends StatelessWidget {
  const Onesideroundedbutton({Key key, this.color, this.icon, this.text,this.textcolor,this.onsbmt})
      : super(key: key);

  final Color color;
  final Icon icon;
  final Text text;
  final Color textcolor;
  final Function onsbmt;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.065,
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              child: RaisedButton(
                  onPressed: onsbmt ,
                  textColor: this.textcolor,
                  color: this.color,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(children: <Widget>[
                          Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: this.icon),
                            this.text
                          ])
                        ])),
                  )))),
    );
  }
}
