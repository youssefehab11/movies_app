import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/auth/register_data_source.dart';
import 'package:movies_app/data/models/user/user_dto.dart';
import 'package:movies_app/data/services/firebase/auth_services.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: RegisterDataSource)
class RegisterDataSourceImpl extends RegisterDataSource {
  AuthServices authServices;

  @factoryMethod
  RegisterDataSourceImpl({required this.authServices});

  @override
  Future<Result<UserDto>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) {
    return authServices.createUserWithEmailAndPassword(
      email: email,
      name: name,
      password: password,
      phoneNumber: phoneNumber,
    );
  }
}
