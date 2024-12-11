import 'package:movies_app/domain/result.dart';
import 'package:movies_app/data/models/movie_response/movie_dto.dart';

abstract class MoviesDataSource {
  Future<Result<List<MovieDTO>>> getMovies(
    String endPoint,
    Map<String, dynamic>? queryParameters,
  );
}
