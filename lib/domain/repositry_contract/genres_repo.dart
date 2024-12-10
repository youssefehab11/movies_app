import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/domain/entities/genre_entity.dart';

abstract class GenresRepo {
  Future<Result<List<GenreEntity>>> getGenres(
      String endPoint, Map<String, dynamic>? queryParameters);
}
