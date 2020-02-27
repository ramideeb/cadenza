import 'package:flutter/material.dart';

class ForgotPassheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      30, MediaQuery.of(context).size.height * 0.1, 0, 0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Forgot\nPassword",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(230, 57, 70, 1),
                            )),
                      )),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/qshape.png',
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                )
              ],
            );
  }
}