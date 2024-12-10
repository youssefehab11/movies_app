import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/entities/genre.dart';

abstract class GenresRepo {
  Future<Result<List<Genre>>> getGenres(
      String endPoint, Map<String, dynamic>? queryParameters);
}
