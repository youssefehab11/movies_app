import 'package:dio/dio.dart';
import 'package:movies_app/core/api_manager/result.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/data/model/genre_response/genre.dart';
import 'package:movies_app/data/model/genre_response/genre_response.dart';
import 'package:movies_app/data/model/movie_response/movie.dart';
import 'package:movies_app/data/model/movie_response/movie_response.dart';

class ApiManager {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: {
          'Authorization': Constants.apiKey,
        },
      ),
    );
  }

  Future<Result<List<Genre>>> getGenres(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response =
          await dio.get(endPoint, queryParameters: queryParameters);
      GenreResponse genreResponse = GenreResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return Success(
          data: genreResponse.genres ?? [],
        );
      } else {
        return ServerError(
          success: genreResponse.success ?? false,
          statusMessage: genreResponse.statusMessage ?? 'Something went wrong',
          statusCode: genreResponse.statusCode ?? -1,
        );
      }
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  Future<Result<List<Movie>>> getMovies({
    required String endPoint,
    required Map<String, dynamic> queryParameters,
  }) async {
    try {
      Response response =
          await dio.get(endPoint, queryParameters: queryParameters);
      MovieResponse result = MovieResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return Success(data: result.results ?? []);
      } else {
        return ServerError(
          success: result.success ?? false,
          statusMessage: result.statusMessage ?? 'Something went wrong',
          statusCode: result.statusCode ?? -1,
        );
      }
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }
}
