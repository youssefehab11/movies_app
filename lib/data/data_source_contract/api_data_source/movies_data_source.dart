import 'package:movies_app/data/models/shared/movie_dto.dart';
import 'package:movies_app/domain/result.dart';

abstract class MoviesDataSource {
  Future<Result<List<MovieDTO>>> getMovies(
    String endPoint,
    Map<String, dynamic>? queryParameters,
  );
}
