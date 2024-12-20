import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/firestore/history_data_source.dart';
import 'package:movies_app/data/services/firebase/firestore_service.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: HistoryDataSource)
class HistoryDataSourceImpl extends HistoryDataSource {
  FireStoreServies fireStoreServies;

  HistoryDataSourceImpl({required this.fireStoreServies});
  @override
  Future<Result<List<Movie>>> getHistory() {
    return fireStoreServies.getHistory();
  }

  @override
  Future<Result<String>> removeMovieFromHistory(Movie movie) {
    return fireStoreServies.removeMovieFromHistory(movie);
  }

  @override
  Future<Result<String>> saveMovieToHistory(Movie movie) {
    return fireStoreServies.saveMovieToHistory(movie);
  }
}
