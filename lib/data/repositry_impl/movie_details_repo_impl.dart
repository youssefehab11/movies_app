import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/movie_details_data_source.dart';
import 'package:movies_app/data/models/shared/movie_dto.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/movie_details_repo.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: MovieDetailsRepo)
class MovieDetailsRepoImpl extends MovieDetailsRepo {
  MovieDetailsDataSource movieDetailsDataSource;

  @factoryMethod
  MovieDetailsRepoImpl({required this.movieDetailsDataSource});

  @override
  Future<Result<Movie>> getMovieById({
    required int movieId,
    required String endPoint,
  }) async {
    Result<MovieDTO> result = await movieDetailsDataSource.getMovieById(
        movieId: movieId, endPoint: endPoint);
    switch (result) {
      case Success<MovieDTO>():
        Movie movie = result.data.toMovieEntity();
        return Success(data: movie);
      case ServerError<MovieDTO>():
        return ServerError(
          statusCode: result.statusCode,
          statusMessage: result.statusMessage,
          success: result.success,
        );
      case Error<MovieDTO>():
        return Error(exception: result.exception);
    }
  }
}
