import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/domain/entities/genre.dart';

class Movie {
  static const String wishListCollection = 'Wishlist';
  static const String historyCollection = 'History';
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

  factory Movie.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Movie(
      id: data?['id'],
      backdropPath: data?['backdropPath'],
      genres: (data?['genres'] as List<dynamic>?)
          ?.map((genre) => Genre.fromMap(genre))
          .toList(),
      overview: data?['overview'],
      posterPath: data?['posterPath'],
      releaseDate: data?['releaseDate'],
      runtime: data?['runtime'],
      title: data?['title'],
      voteAverage: data?['voteAverage'],
      voteCount: data?['voteCount'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (backdropPath != null) "backdropPath": backdropPath,
      if (genres != null)
        'genres': genres?.map((genre) => genre.toMap()).toList(),
      if (overview != null) "overview": overview,
      if (posterPath != null) "posterPath": posterPath,
      if (releaseDate != null) "releaseDate": releaseDate,
      if (runtime != null) "runtime": runtime,
      if (title != null) "title": title,
      if (voteAverage != null) "voteAverage": voteAverage,
      if (voteCount != null) "voteCount": voteCount,
    };
  }
}
