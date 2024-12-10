import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositry_contract/movies_repo.dart';

class GetMoviesUseCase {
  MoviesRepo moviesRepo;
  GetMoviesUseCase({required this.moviesRepo});
  Future<Result<List<MovieEntity>>> execute(
      String endPoint, Map<String, dynamic> queryParameters) {
    return moviesRepo.getMovies(endPoint, queryParameters);
  }
}
