import 'package:movies_app/domain/entities/genre.dart';

class GenreDTO {
  int? id;
  String? name;

  GenreDTO({
    this.id,
    this.name,
  });

  GenreDTO.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  Genre toGenreEntity() {
    return Genre(
      id: id,
      name: name,
    );
  }
}
