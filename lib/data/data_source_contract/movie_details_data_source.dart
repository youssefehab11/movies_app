import 'package:movies_app/data/models/shared/movie_dto.dart';
import 'package:movies_app/domain/result.dart';

abstract class MovieDetailsDataSource {
  Future<Result<MovieDTO>> getMovieById({
    required int movieId,
    required String endPoint,
  });
}
