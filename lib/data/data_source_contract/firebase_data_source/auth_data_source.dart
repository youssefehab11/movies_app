import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/domain/result.dart';

abstract class AuthDataSource {
  Future<Result<UserCredential>> createUserWithEmailAndPassword(
    String email,
    String password,
  );
}
