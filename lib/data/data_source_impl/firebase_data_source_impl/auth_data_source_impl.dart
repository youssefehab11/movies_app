import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/auth_data_source.dart';
import 'package:movies_app/data/services/firebase/auth_services.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl extends AuthDataSource {
  AuthServices authServices;

  @factoryMethod
  AuthDataSourceImpl({required this.authServices});

  @override
  Future<Result<UserCredential>> createUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    return authServices.createUserWithEmailAndPassword(email, password);
  }
}
