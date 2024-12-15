import 'package:injectable/injectable.dart';
import 'package:movies_app/data/services/api/api_manager.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/data/data_source_contract/api_data_source/genres_data_source.dart';
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
