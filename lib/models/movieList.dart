class MovieListData {
  final String title;
  final String imdbID;
  final String poster;
  final String year;

  MovieListData(
      {required this.title,
      required this.imdbID,
      required this.poster,
      required this.year});

  factory MovieListData.fromJson(Map<List, dynamic> json) {
    return MovieListData(
        title: json['Title'],
        imdbID: json['imdbID'],
        poster: json['Poster'],
        year: json['Year']);
  }
}
