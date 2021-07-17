import 'package:flutter/material.dart';
import 'package:moviegoers/Providers/movie.dart';
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
      appBar: AppBar(
        title: Text('Movie Goers App'),
      ),
      body: Center(
        child: FutureBuilder<MovieDetailData>(
          future: movieProvider.getMovieDetail(imdbID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Card(
                  child: SafeArea(
                      child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      snapshot.data!.poster,
                      height: 500,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          snapshot.data!.title,
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(snapshot.data!.plot),
                        Text(snapshot.data!.writer),
                        Text(snapshot.data!.actors),
                        Text(snapshot.data!.genre),
                        Text(snapshot.data!.rated),
                        Text("${snapshot.data!.imdbRating}/10"),
                      ],
                    ),
                  ],
                ),
              )));
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
