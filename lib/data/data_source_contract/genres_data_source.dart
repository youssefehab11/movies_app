import 'package:movies_app/domain/result.dart';
import 'package:movies_app/data/models/shared/genre_dto.dart';

abstract class GenresDataSource {
  Future<Result<List<GenreDTO>>> getGenres(
      String endPoint, Map<String, dynamic>? queryParameters);
}
