import 'package:movies_app/domain/entities/genre.dart';

class Movie {
  String? backdropPath;
  List<Genre>? genres;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  num? voteAverage;
  int? voteCount;
  num? runtime;

  Movie({
    this.backdropPath,
    this.genres,
    this.id,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
    this.runtime,
  });
}
