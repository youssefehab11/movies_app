import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

abstract class HistoryDataSource {
  Future<Result<String>> saveMovieToHistory(Movie movie);
  Future<Result<String>> removeMovieFromHistory(Movie movie);
  Future<Result<List<Movie>>> getHistory();
}
