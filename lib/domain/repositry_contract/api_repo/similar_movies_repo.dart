import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

abstract class SimilarMoviesRepo {
  Future<Result<List<Movie>>> getSimilarMovies(
      {required int movieId, Map<String, dynamic>? queryParameters});
}
