class MovieDetailData {
  final String title;
  final String imdbID;
  final String poster;
  final String year;
  final String plot;

  MovieDetailData(
      {required this.title,
      required this.imdbID,
      required this.poster,
      required this.year,
      required this.plot});

  factory MovieDetailData.fromJson(Map<String, dynamic> json) {
    return MovieDetailData(
        title: json['Title'],
        imdbID: json['imdbID'],
        poster: json['Poster'],
        year: json['Year'],
        plot: json['Plot']);
  }
}
