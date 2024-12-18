import 'package:movies_app/data/models/user/user_dto.dart';
import 'package:movies_app/domain/result.dart';

abstract class RegisterDataSource {
  Future<Result<UserDto>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  });
}
