import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/api_data_source/similar_movies_data_source.dart';
import 'package:movies_app/data/models/shared/movie_dto.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/api_repo/similar_movies_repo.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: SimilarMoviesRepo)
class SimilarMoviesRepoImpl extends SimilarMoviesRepo {
  SimilarMoviesDataSource similarMoviesDataSource;

  @factoryMethod
  SimilarMoviesRepoImpl({required this.similarMoviesDataSource});

  @override
  Future<Result<List<Movie>>> getSimilarMovies(
      {required int movieId, Map<String, dynamic>? queryParameters}) async {
    Result<List<MovieDTO>> result =
        await similarMoviesDataSource.getSimilarMovies(movieId: movieId);
    switch (result) {
      case Success<List<MovieDTO>>():
        List<Movie> movies = result.data
            .map(
              (movie) => movie.toMovieEntity(),
            )
            .toList();
        return Success(data: movies);
      case ServerError<List<MovieDTO>>():
        return ServerError(
          statusCode: result.statusCode,
          statusMessage: result.statusMessage,
          success: result.success,
        );
      case Error<List<MovieDTO>>():
        return Error(exception: result.exception);
    }
  }
}
