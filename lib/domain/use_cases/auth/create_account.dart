import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/auth_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class CreateAccountUseCase {
  AuthRepo authRepo;
  @factoryMethod
  CreateAccountUseCase({required this.authRepo});

  Future<Result<UserCredential>> execute(String email, String password) {
    return authRepo.createAccountWithEmailAndPassword(email, password);
  }
}
