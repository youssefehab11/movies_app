import 'package:injectable/injectable.dart';
import 'package:movies_app/data/services/api/api_manager.dart';
import 'package:movies_app/data/models/shared/movie_dto.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/data/data_source_contract/api_data_source/movies_data_source.dart';

@Injectable(as: MoviesDataSource)
class MoviesDataSourceImpl extends MoviesDataSource {
  ApiManager apiManager;
  @factoryMethod
  MoviesDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<MovieDTO>>> getMovies(
    String endPoint,
    Map<String, dynamic>? queryParameters,
  ) {
    return apiManager.getMovies(
      endPoint: endPoint,
      queryParameters: queryParameters,
    );
  }
}
