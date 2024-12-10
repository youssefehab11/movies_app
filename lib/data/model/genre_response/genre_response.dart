import 'package:movies_app/data/model/genre_response/genre.dart';

class GenreResponse {
  List<Genre>? genres;
  bool? success;
  int? statusCode;
  String? statusMessage;

  GenreResponse({
    this.genres,
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  GenreResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genre.fromJson(v));
      });
    }
    success = json['success'];
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
