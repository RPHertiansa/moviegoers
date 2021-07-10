import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/movieDetail.dart';
import '../models/movieList.dart';

Future<MovieListData> getMoviesList(title) async {
  final response = await http
      .get(Uri.parse('http://www.omdbapi.com/?apikey=1b60a4ef&s=$title'));

  if (response.statusCode == 200) {
    return MovieListData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

Future<MovieDetailData> getMovieDetail(imdbID) async {
  final response = await http
      .get(Uri.parse('http://www.omdbapi.com/?apikey=1b60a4ef&i=$imdbID'));

  if (response.statusCode == 200) {
    return MovieDetailData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load movie data');
  }
}
