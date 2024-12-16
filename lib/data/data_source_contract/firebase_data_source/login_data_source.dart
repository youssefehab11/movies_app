import 'package:movies_app/data/models/user/user_dto.dart';
import 'package:movies_app/domain/result.dart';

abstract class LoginDataSource {
  Future<Result<UserDto?>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
