import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/firestore/history_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class GetHistoryUseCase {
  HistoryRepo historyRepo;

  @factoryMethod
  GetHistoryUseCase({required this.historyRepo});

  Future<Result<List<Movie>>> execute() {
    return historyRepo.getHistroyt();
  }
}
