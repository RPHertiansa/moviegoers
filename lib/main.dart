import 'package:flutter/material.dart';
import 'package:moviegoers/Screens/opening.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Goers App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Opening(),
    );
  }
}
