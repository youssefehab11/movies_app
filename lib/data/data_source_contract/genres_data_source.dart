import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/data/model/genre_response/genre.dart';

abstract class GenresDataSource {
  Future<Result<List<Genre>>> getGenres(
      String endPoint, Map<String, dynamic>? queryParameters);
}
