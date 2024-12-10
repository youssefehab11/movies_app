import 'movie_dto.dart';

class MovieResponse {
  int? page;
  List<MovieDTO>? results;
  int? totalPages;
  int? totalResults;
  bool? success;
  String? statusMessage;
  int? statusCode;

  MovieResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  MovieResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MovieDTO.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    success = json['success'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
