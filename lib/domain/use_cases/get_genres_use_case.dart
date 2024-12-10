import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/domain/entities/genre_entity.dart';
import 'package:movies_app/domain/repositry_contract/genres_repo.dart';

class GetGenresUseCase {
  GenresRepo genresRepo;
  GetGenresUseCase({required this.genresRepo});
  Future<Result<List<GenreEntity>>> execute({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) {
    return genresRepo.getGenres(endPoint, queryParameters);
  }
}
