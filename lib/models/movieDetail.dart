class MovieDetailData {
  final String title;
  final String imdbID;
  final String poster;
  final String year;
  final String plot;
  final String writer;
  final String actors;
  final String imdbRating;
  final String genre;
  final String rated;

  MovieDetailData(
      {required this.title,
      required this.imdbID,
      required this.poster,
      required this.year,
      required this.plot,
      required this.writer,
      required this.actors,
      required this.imdbRating,
      required this.genre,
      required this.rated});

  factory MovieDetailData.fromJson(Map<String, dynamic> json) {
    return MovieDetailData(
        title: json['Title'],
        imdbID: json['imdbID'],
        poster: json['Poster'],
        year: json['Year'],
        plot: json['Plot'],
        writer: json['Writer'],
        actors: json['Actors'],
        imdbRating: json['imdbRating'],
        genre: json['Genre'],
        rated: json['Rated']);
  }
}
