import 'package:injectable/injectable.dart';
import 'package:movies_app/data/api_manager/api_manager.dart';
import 'package:movies_app/data/data_source_contract/movie_details_data_source.dart';
import 'package:movies_app/data/models/shared/movie_dto.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: MovieDetailsDataSource)
class MovieDetailsDataSourceImpl extends MovieDetailsDataSource {
  ApiManager apiManager;

  @factoryMethod
  MovieDetailsDataSourceImpl({required this.apiManager});

  @override
  Future<Result<MovieDTO>> getMovieById({
    required int movieId,
    required String endPoint,
  }) {
    return apiManager.getMovieById(movieId: movieId, endPoint: endPoint);
  }
}
