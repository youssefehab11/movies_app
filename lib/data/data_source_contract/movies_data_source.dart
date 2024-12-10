import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/data/model/movie_response/movie.dart';

abstract class MoviesDataSource {
  Future<Result<List<Movie>>> getMovies(
    String endPoint,
    Map<String, dynamic> queryParameters,
  );
}
