class MovieEntity {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  num? voteAverage;
  int? voteCount;

  MovieEntity({
    this.backdropPath,
    this.genreIds,
    this.id,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  });
}
