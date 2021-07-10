import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/movieDetail.dart';

class MovieDetail extends StatelessWidget {
  final String imdbID;

  MovieDetail({required this.imdbID});

  Future<MovieDetailData> getMovieDetail(imdbID) async {
    final response = await http
        .get(Uri.parse('http://www.omdbapi.com/?apikey=1b60a4ef&i=$imdbID'));

    if (response.statusCode == 200) {
      return MovieDetailData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Goers App'),
      ),
      body: Center(
        child: FutureBuilder<MovieDetailData>(
          future: getMovieDetail(imdbID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
