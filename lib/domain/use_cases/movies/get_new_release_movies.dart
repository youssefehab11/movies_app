import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/movies_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class GetNewReleaseMoviesUseCase {
  MoviesRepo moviesRepo;
  @factoryMethod
  GetNewReleaseMoviesUseCase({required this.moviesRepo});
  Future<Result<List<Movie>>> execute(
      String endPoint, Map<String, dynamic>? queryParameters) {
    return moviesRepo.getMovies(endPoint, queryParameters);
  }
}
