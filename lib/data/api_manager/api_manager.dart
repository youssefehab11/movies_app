import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/presentation/core/utils/constants.dart';
import 'package:movies_app/data/models/error_response.dart';
import 'package:movies_app/data/models/genre_response/genre_dto.dart';
import 'package:movies_app/data/models/genre_response/genre_response.dart';
import 'package:movies_app/data/models/movie_response/movie_dto.dart';
import 'package:movies_app/data/models/movie_response/movie_response.dart';

@singleton
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

  Future<Result<List<GenreDTO>>> getGenres(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response =
          await dio.get(endPoint, queryParameters: queryParameters);
      GenreResponse genreResponse = GenreResponse.fromJson(response.data);
      return Success(
        data: genreResponse.genres ?? [],
      );
    } on DioException catch (error) {
      ErrorResponse? errorResponse;
      if (error.response?.data != null) {
        errorResponse = ErrorResponse.fromJson(error.response?.data);
      }
      return ServerError(
        success: errorResponse?.success ?? false,
        statusMessage: errorResponse?.statusMessage ?? error.message,
        statusCode: errorResponse?.statusCode,
      );
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  Future<Result<List<MovieDTO>>> getMovies({
    required String endPoint,
    required Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response =
          await dio.get(endPoint, queryParameters: queryParameters);
      MovieResponse result = MovieResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return Success(data: result.results ?? []);
      } else {
        return ServerError(
          success: result.success,
          statusMessage: result.statusMessage,
          statusCode: result.statusCode,
        );
      }
    } on DioException catch (error) {
      ErrorResponse? errorResponse;
      if (error.response?.data != null) {
        errorResponse = ErrorResponse.fromJson(error.response?.data);
      }
      return ServerError(
        success: errorResponse?.success ?? false,
        statusMessage: errorResponse?.statusMessage ?? error.message,
        statusCode: errorResponse?.statusCode,
      );
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }
}
