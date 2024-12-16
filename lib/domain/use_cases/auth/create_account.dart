import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/register_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class CreateAccountUseCase {
  RegisterRepo authRepo;
  @factoryMethod
  CreateAccountUseCase({required this.authRepo});

  Future<Result<UserEntity>> execute({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) {
    return authRepo.createAccountWithEmailAndPassword(
      email: email,
      name: name,
      password: password,
      phoneNumber: phoneNumber,
    );
  }
}
