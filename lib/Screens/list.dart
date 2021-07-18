import 'package:flutter/material.dart';
import 'package:moviegoers/Screens/detail.dart';
import 'package:moviegoers/Providers/movie.dart';
import 'package:moviegoers/Widgets/appheader.dart';
import 'package:moviegoers/Widgets/loading.dart';
import 'package:moviegoers/Widgets/error.dart';

class MovieList extends StatelessWidget {
  final String movieTitle;

  MovieList({required this.movieTitle});

  var movieProvider = MovieProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: 'Results for "$movieTitle"'),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: movieProvider.getMovieList(movieTitle),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MovieDetail(
                                imdbID: snapshot.data[index]['imdbID']);
                          }));
                        }, //function lambda
                        child: Card(
                            color: Color(0xffF2DB83),
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            child: Image.network(
                                      snapshot.data[index]['Poster'],
                                      height: 500,
                                    ))),
                                    Container(
                                        child: Column(
                                      children: <Widget>[
                                        Text(
                                          snapshot.data[index]['Title'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(snapshot.data[index]['Year'])
                                      ],
                                    ))
                                  ],
                                ))));
                  });
            } else if (snapshot.hasError) {
              return Error(errorMessage: "${snapshot.error}");
            }
            return Loading();
          },
        ),
      ),
    );
  }
}
