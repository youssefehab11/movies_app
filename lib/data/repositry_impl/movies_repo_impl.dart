import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/data/data_source_contract/movies_data_source.dart';
import 'package:movies_app/data/model/movie_response/movie.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositry_contract/movies_repo.dart';

class MoviesRepoImpl extends MoviesRepo {
  MoviesDataSource moviesDataSource;
  MoviesRepoImpl({required this.moviesDataSource});
  @override
  Future<Result<List<MovieEntity>>> getMovies(
    String endPoint,
    Map<String, dynamic> queryParameters,
  ) async {
    Result<List<Movie>> result =
        await moviesDataSource.getMovies(endPoint, queryParameters);
    switch (result) {
      case Success<List<Movie>>():
        {
          List<MovieEntity> movies = result.data
              .map(
                (movie) => movie.toMovieEntity(),
              )
              .toList();
          return Success(data: movies);
        }
      case ServerError<List<Movie>>():
        {
          return ServerError(
            success: result.success,
            statusMessage: result.statusMessage,
            statusCode: result.statusCode,
          );
        }
      case Error<List<Movie>>():
        {
          return Error(exception: result.exception);
        }
    }
  }
}
