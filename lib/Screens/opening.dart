import 'package:flutter/material.dart';
import 'package:moviegoers/Screens/search.dart';
import 'package:moviegoers/Widgets/appheader.dart';

class Opening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppHeader(title: 'Movie Goers App'),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                    Text('Welcome',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffF2DB83))),
                    Text('to',
                        style:
                            TextStyle(fontSize: 24, color: Color(0xffF2DB83))),
                    Text('Movie Goers App',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffDBA506))),
                    SizedBox(
                      height: 70,
                    ),
                    Text('Unlimited movies, TV',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text('shows and more.',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text('Watch anywhere. Cancel any time.',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    SizedBox(
                      height: 90,
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xffDBA506)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Search();
                        }));
                      },
                      child: SizedBox(
                          width: 120,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Explore Now'),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ])),
                    )
                  ],
                ))),
          ),
        ));
  }
}
