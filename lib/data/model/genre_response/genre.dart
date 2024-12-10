import 'package:movies_app/domain/entities/genre_entity.dart';

class Genre {
  int? id;
  String? name;

  Genre({
    this.id,
    this.name,
  });

  Genre.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  GenreEntity toGenreEntity() {
    return GenreEntity(
      id: id,
      name: name,
    );
  }
}
