import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/entities/movie.dart';

abstract class MoviesRepo {
  Future<Result<List<Movie>>> getExploreMovies(
      String endPoint, Map<String, dynamic>? queryParameters);
}
