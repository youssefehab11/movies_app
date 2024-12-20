import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/firestore/history_data_source.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/firestore/history_repo.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: HistoryRepo)
class HistoryRepoImpl extends HistoryRepo {
  HistoryDataSource historyDataSource;

  @factoryMethod
  HistoryRepoImpl({required this.historyDataSource});

  @override
  Future<Result<List<Movie>>> getHistroyt() {
    return historyDataSource.getHistory();
  }

  @override
  Future<Result<String>> removeMovieFromHistory(Movie movie) {
    return historyDataSource.removeMovieFromHistory(movie);
  }

  @override
  Future<Result<String>> saveMovieToHistory(Movie movie) {
    return historyDataSource.saveMovieToHistory(movie);
  }
}
