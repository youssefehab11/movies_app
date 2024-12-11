import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/domain/entities/genre.dart';
import 'package:movies_app/domain/repositry_contract/genres_repo.dart';

@injectable
class GetGenresUseCase {
  GenresRepo genresRepo;
  @factoryMethod
  GetGenresUseCase({required this.genresRepo});
  Future<Result<List<Genre>>> execute({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) {
    return genresRepo.getGenres(endPoint, queryParameters);
  }
}
