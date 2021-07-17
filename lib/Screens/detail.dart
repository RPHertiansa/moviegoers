import 'package:flutter/material.dart';
import 'package:moviegoers/Providers/movie.dart';
import 'package:moviegoers/Widgets/appheader.dart';
import 'package:moviegoers/Widgets/error.dart';
import 'package:moviegoers/Widgets/loading.dart';
import 'package:moviegoers/models/movieDetail.dart';

class MovieDetail extends StatelessWidget {
  final String imdbID;

  MovieDetail({required this.imdbID});

  var movieProvider = MovieProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: 'Movie Goers App'),
      body: Center(
        child: FutureBuilder<MovieDetailData>(
          future: movieProvider.getMovieDetail(imdbID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Card(
                  child: SafeArea(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star_rate_rounded,
                                            color: Colors.yellowAccent,
                                            size: 24,
                                          ),
                                          Text(
                                            "${snapshot.data!.imdbRating}/10",
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                      Text(snapshot.data!.rated,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  Image.network(
                                    snapshot.data!.poster,
                                    height: 500,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data!.title,
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffDBA506)),
                                      ),
                                      Text(
                                        snapshot.data!.genre,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffF2DB83)),
                                      ),
                                      Text(snapshot.data!.year),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text(snapshot.data!.plot),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text('Written By:'),
                                      Text(snapshot.data!.writer),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text('Starring:'),
                                      Text(snapshot.data!.actors),
                                    ],
                                  ),
                                ],
                              )))));
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
