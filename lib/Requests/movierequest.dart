import 'package:http/http.dart' as http;

Future<http.Response> fetchMovies() {
  return http.get(Uri.parse('http://www.omdbapi.com/?apikey=1b60a4ef&s='));
}
