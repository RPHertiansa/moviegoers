import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moviegoers/models/movieDetail.dart';

class MovieProvider extends ChangeNotifier {
  Future<MovieDetailData> getMovieDetail(imdbID) async {
    final response = await http
        .get(Uri.parse('http://www.omdbapi.com/?apikey=1b60a4ef&i=$imdbID'));

    if (response.statusCode == 200) {
      return MovieDetailData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie data');
    }
  }

  Future<List<dynamic>> getMovieList(movieTitle) async {
    var result = await http.get(
        Uri.parse("http://www.omdbapi.com/?apikey=1b60a4ef&s=$movieTitle'"));
    return json.decode(result.body)['Search'];
  }
}
