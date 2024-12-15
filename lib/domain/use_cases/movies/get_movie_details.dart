import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/api_repo/movie_details_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class GetMovieDetailsUseCase {
  MovieDetailsRepo movieDetailsRepo;

  @factoryMethod
  GetMovieDetailsUseCase({required this.movieDetailsRepo});

  Future<Result<Movie>> execute(int movieId, String endPoint) async {
    return await movieDetailsRepo.getMovieById(
        movieId: movieId, endPoint: endPoint);
  }
}
