import 'package:movies_app/data/models/genre_response/genre_dto.dart';

class GenreResponse {
  List<GenreDTO>? genres;
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
        genres?.add(GenreDTO.fromJson(v));
      });
    }
    success = json['success'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
