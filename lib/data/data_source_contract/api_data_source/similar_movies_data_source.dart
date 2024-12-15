import 'package:movies_app/data/models/shared/movie_dto.dart';
import 'package:movies_app/domain/result.dart';

abstract class SimilarMoviesDataSource {
  Future<Result<List<MovieDTO>>> getSimilarMovies({
    required int movieId,
    Map<String, dynamic>? queryParameters,
  });
}
