import 'package:movies_app/core/api_manager/api_manager.dart';
import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/data/data_source_contract/movies_data_source.dart';
import 'package:movies_app/data/model/movie_response/movie.dart';

class MoviesDataSourceImpl extends MoviesDataSource {
  ApiManager apiManager;
  MoviesDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Movie>>> getMovies(
    String endPoint,
    Map<String, dynamic> queryParameters,
  ) {
    return apiManager.getMovies(
      endPoint: endPoint,
      queryParameters: queryParameters,
    );
  }
}
