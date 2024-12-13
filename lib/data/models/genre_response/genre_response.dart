import 'package:movies_app/data/models/shared/genre_dto.dart';

class GenreResponse {
  List<GenreDTO>? genres;

  GenreResponse({
    this.genres,
  });

  GenreResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(GenreDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
