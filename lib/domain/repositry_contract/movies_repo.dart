import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

abstract class MoviesRepo {
  Future<Result<List<MovieEntity>>> getMovies(
      String endPoint, Map<String, dynamic> queryParameters);
}
