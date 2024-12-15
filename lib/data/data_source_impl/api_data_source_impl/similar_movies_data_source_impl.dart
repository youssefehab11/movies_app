import 'package:injectable/injectable.dart';
import 'package:movies_app/data/services/api/api_manager.dart';
import 'package:movies_app/data/data_source_contract/api_data_source/similar_movies_data_source.dart';
import 'package:movies_app/data/models/shared/movie_dto.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: SimilarMoviesDataSource)
class SimilarMoviesDataSourceImpl extends SimilarMoviesDataSource {
  ApiManager apiManager;

  @factoryMethod
  SimilarMoviesDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<MovieDTO>>> getSimilarMovies({
    required int movieId,
    Map<String, dynamic>? queryParameters,
  }) {
    return apiManager.getSimilarMovies(
        movieId: movieId, queryParameters: queryParameters);
  }
}
