import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/logout_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class SignOutUseCase {
  LogoutRepo logoutRepo;

  SignOutUseCase({required this.logoutRepo});

  Future<Result<String>> execute() {
    return logoutRepo.signOut();
  }
}
