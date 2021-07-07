import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final String title;

  MovieList({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Goers App'),
      ),
      body: Container(
          child: Text(
            'HI ' + title,
            style: TextStyle(fontSize: 40),
          ),
          color: Colors.green,
          margin: EdgeInsets.all(10)),
    );
  }
}
