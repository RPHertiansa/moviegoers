import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String errorMessage;

  Error({required this.errorMessage});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      SizedBox(
        height: 250,
      ),
      Icon(
        Icons.error,
        color: Colors.red,
        size: 80,
      ),
      SizedBox(
        height: 10,
      ),
      Text("$errorMessage")
    ]));
  }
}
