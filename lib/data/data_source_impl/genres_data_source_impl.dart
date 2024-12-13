import 'package:injectable/injectable.dart';
import 'package:movies_app/data/api_manager/api_manager.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/data/data_source_contract/genres_data_source.dart';
import 'package:movies_app/data/models/shared/genre_dto.dart';

@Injectable(as: GenresDataSource)
class GenresDataSourceImpl extends GenresDataSource {
  ApiManager apiManager;
  @factoryMethod
  GenresDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<GenreDTO>>> getGenres(
      String endPoint, Map<String, dynamic>? queryParameters) async {
    return apiManager.getGenres(endPoint, queryParameters: queryParameters);
  }
}
