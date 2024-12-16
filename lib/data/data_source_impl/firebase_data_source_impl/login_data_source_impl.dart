import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/login_data_source.dart';
import 'package:movies_app/data/models/user/user_dto.dart';
import 'package:movies_app/data/services/firebase/auth_services.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImp extends LoginDataSource {
  AuthServices authServices;

  @factoryMethod
  LoginDataSourceImp({required this.authServices});
  @override
  Future<Result<UserDto?>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return authServices.signInWithEmailAndPassword(email, password);
  }
}
