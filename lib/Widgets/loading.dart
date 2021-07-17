import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      SizedBox(
        height: 300,
      ),
      CircularProgressIndicator(),
      SizedBox(
        height: 10,
      ),
      Text('Please wait while data is being fetched')
    ]));
  }
}
