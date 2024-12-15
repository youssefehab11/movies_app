import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/api_repo/similar_movies_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class GetSimilarMoviesUseCase {
  SimilarMoviesRepo similarMoviesRepo;

  GetSimilarMoviesUseCase({required this.similarMoviesRepo});

  Future<Result<List<Movie>>> execute(
      {required int movieId, Map<String, dynamic>? queryParameters}) {
    return similarMoviesRepo.getSimilarMovies(
        movieId: movieId, queryParameters: queryParameters);
  }
}
