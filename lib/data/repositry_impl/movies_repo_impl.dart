import 'package:movies_app/domain/result.dart';
import 'package:movies_app/data/data_source_contract/movies_data_source.dart';
import 'package:movies_app/data/models/movie_response/movie_dto.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/movies_repo.dart';

class MoviesRepoImpl extends MoviesRepo {
  MoviesDataSource moviesDataSource;
  MoviesRepoImpl({required this.moviesDataSource});
  @override
  Future<Result<List<Movie>>> getExploreMovies(
    String endPoint,
    Map<String, dynamic>? queryParameters,
  ) async {
    Result<List<MovieDTO>> result =
        await moviesDataSource.getMovies(endPoint, queryParameters);
    switch (result) {
      case Success<List<MovieDTO>>():
        {
          List<Movie> movies = result.data
              .map(
                (movie) => movie.toMovieEntity(),
              )
              .toList();
          return Success(data: movies);
        }
      case ServerError<List<MovieDTO>>():
        {
          return ServerError(
            success: result.success,
            statusMessage: result.statusMessage,
            statusCode: result.statusCode,
          );
        }
      case Error<List<MovieDTO>>():
        {
          return Error(exception: result.exception);
        }
    }
  }
}
