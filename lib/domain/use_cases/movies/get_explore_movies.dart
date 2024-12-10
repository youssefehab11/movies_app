import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/movies_repo.dart';

class GetExploreMoviesUseCase {
  MoviesRepo moviesRepo;
  GetExploreMoviesUseCase({required this.moviesRepo});
  Future<Result<List<Movie>>> execute(
      String endPoint, Map<String, dynamic>? queryParameters) {
    return moviesRepo.getExploreMovies(endPoint, queryParameters);
  }
}
