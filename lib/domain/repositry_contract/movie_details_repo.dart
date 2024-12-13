import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

abstract class MovieDetailsRepo {
  Future<Result<Movie>> getMovieById({
    required int movieId,
    required String endPoint,
  });
}
