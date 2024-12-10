import 'package:movies_app/core/api_manager/api_manager.dart';
import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/data/data_source_contract/genres_data_source.dart';
import 'package:movies_app/data/model/genre_response/genre.dart';

class GenresDataSourceImpl extends GenresDataSource {
  ApiManager apiManager;
  GenresDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Genre>>> getGenres(
      String endPoint, Map<String, dynamic>? queryParameters) {
    return apiManager.getGenres(endPoint, queryParameters: queryParameters);
  }
}
