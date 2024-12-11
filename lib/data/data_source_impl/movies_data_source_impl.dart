import 'package:injectable/injectable.dart';
import 'package:movies_app/data/api_manager/api_manager.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/data/data_source_contract/movies_data_source.dart';
import 'package:movies_app/data/models/movie_response/movie_dto.dart';

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
