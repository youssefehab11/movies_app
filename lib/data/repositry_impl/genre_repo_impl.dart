import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/data/data_source_contract/genres_data_source.dart';
import 'package:movies_app/data/models/genre_response/genre_dto.dart';
import 'package:movies_app/domain/entities/genre.dart';
import 'package:movies_app/domain/repositry_contract/genres_repo.dart';

@Injectable(as: GenresRepo)
class GenreRepoImpl extends GenresRepo {
  GenresDataSource genresDataSource;
  @factoryMethod
  GenreRepoImpl({required this.genresDataSource});

  @override
  Future<Result<List<Genre>>> getGenres(
      String endPoint, Map<String, dynamic>? queryParameters) async {
    Result<List<GenreDTO>> result =
        await genresDataSource.getGenres(endPoint, queryParameters);
    switch (result) {
      case Success():
        {
          List<Genre> genresEntity = result.data
              .map(
                (genre) => genre.toGenreEntity(),
              )
              .toList();
          return Success(data: genresEntity);
        }
      case ServerError():
        {
          return ServerError(
            success: result.success,
            statusMessage: result.statusMessage,
            statusCode: result.statusCode,
          );
        }
      case Error():
        {
          return Error(exception: result.exception);
        }
    }
  }
}
