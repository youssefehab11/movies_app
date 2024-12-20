import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/firestore/history_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class RemoveMovieFromHistoryUseCase {
  HistoryRepo historyRepo;

  @factoryMethod
  RemoveMovieFromHistoryUseCase({required this.historyRepo});

  Future<Result<String>> execute(Movie movie) {
    return historyRepo.removeMovieFromHistory(movie);
  }
}
