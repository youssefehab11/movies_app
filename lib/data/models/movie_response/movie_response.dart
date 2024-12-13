import 'package:movies_app/data/models/shared/movie_dto.dart';

class MovieResponse {
  int? page;
  List<MovieDTO>? movies;
  int? totalPages;
  int? totalResults;

  MovieResponse({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  MovieResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      movies = [];
      json['results'].forEach((v) {
        movies?.add(MovieDTO.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (movies != null) {
      map['results'] = movies?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
