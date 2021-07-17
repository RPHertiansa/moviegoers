import 'package:flutter/material.dart';
import 'package:moviegoers/Screens/search.dart';

class Opening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
          title: Text('First Screen')),
      body: Container(
          child: Text(
            'HI',
            style: TextStyle(fontSize: 40),
          ),
          color: Colors.green,
          margin: EdgeInsets.all(10)),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Search();
            }));
          },
          child: Icon(Icons.search, color: Colors.white)),
    );
  }
}
