import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/auth_data_source.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/auth_repo.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthDataSource authDataSource;

  @factoryMethod
  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Result<UserCredential>> createAccountWithEmailAndPassword(
    String email,
    String password,
  ) {
    return authDataSource.createUserWithEmailAndPassword(email, password);
  }
}
