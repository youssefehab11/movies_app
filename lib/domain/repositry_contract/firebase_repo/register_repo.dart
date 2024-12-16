import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/result.dart';

abstract class RegisterRepo {
  Future<Result<UserEntity>> createAccountWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  });
}
