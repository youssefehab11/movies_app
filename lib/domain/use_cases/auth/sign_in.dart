import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/login_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class LoginUseCase {
  LoginRepo loginRepo;
  @factoryMethod
  LoginUseCase({required this.loginRepo});

  Future<Result<UserEntity?>> execute(String email, String password) {
    return loginRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
