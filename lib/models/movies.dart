class Movie {
  final String title;
  final String year;
  final String type;
  final String poster;
  final String imdbRating;
  final String genre;
  final String imdbId;

  Movie({this.genre, this.imdbId, this.title, this.year, this.type, this.poster, this.imdbRating});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['Title'],
        imdbId: json['IMDb ID'],
        year: json['Year'],
        type: json['Type'],
        poster: json['Poster'],
        genre: json['Genre'],
        imdbRating: json['imdbID']);
  }
}