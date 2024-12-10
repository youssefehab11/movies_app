import 'package:movies_app/data/repositry_impl/movies_repo_impl.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

class GetPopularMoviesUseCase {
  MoviesRepoImpl moviesRepo;
  GetPopularMoviesUseCase({required this.moviesRepo});
  Future<Result<List<Movie>>> execute(
      String endPoint, Map<String, dynamic>? queryParameters) {
    return moviesRepo.getExploreMovies(endPoint, queryParameters);
  }
}
