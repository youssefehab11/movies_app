import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/result.dart';

abstract class LoginRepo {
  Future<Result<UserEntity?>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
