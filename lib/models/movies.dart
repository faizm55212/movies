import 'dart:convert';

MovieList moviesFromJson(String str) => MovieList.fromJson(json.decode(str));

class MovieList {
  MovieList({
    this.movies,
  });

  List<Movie> movies;

  factory MovieList.fromJson(Map<String, dynamic> json) => MovieList(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );
}

// MovieList movieListFromJson(String str) => MovieList.fromJson(json.decode(str));
// List<Movie> moviesFromJson(String str) =>
//     List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

class Movie {
  Movie({
    this.director,
    this.writers,
    this.stars,
    this.productionCompany,
    this.pageViews,
    this.upVoted,
    this.downVoted,
    this.title,
    this.language,
    this.runTime,
    this.releasedDate,
    this.genre,
    this.trailerUrl,
    this.poster,
  });

  List<String> director;
  List<String> writers;
  List<String> stars;
  List<String> productionCompany;
  int pageViews;
  List<String> upVoted;
  List<String> downVoted;
  String title;
  Language language;
  int runTime;
  int releasedDate;
  String genre;
  String trailerUrl;
  String poster;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        director: List<String>.from(json["director"].map((x) => x)),
        writers: List<String>.from(json["writers"].map((x) => x)),
        stars: List<String>.from(json["stars"].map((x) => x)),
        productionCompany:
            List<String>.from(json["productionCompany"].map((x) => x)),
        pageViews: json["pageViews"],
        upVoted: json["upVoted"] == null
            ? null
            : List<String>.from(json["upVoted"].map((x) => x)),
        downVoted: json["downVoted"] == null
            ? null
            : List<String>.from(json["downVoted"].map((x) => x)),
        title: json["title"],
        language: languageValues.map[json["language"]],
        runTime: json["runTime"] == null ? null : json["runTime"],
        releasedDate: json["releasedDate"],
        genre: json["genre"],
        trailerUrl: json["trailerUrl"],
        poster: json["poster"],
      );
}

enum Language { KANNADA, HINDI_KANNADA_TELUGU }

final languageValues = EnumValues({
  "Hindi,Kannada,Telugu": Language.HINDI_KANNADA_TELUGU,
  "Kannada": Language.KANNADA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
