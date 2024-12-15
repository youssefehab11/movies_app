import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/domain/result.dart';

abstract class AuthRepo {
  Future<Result<UserCredential>> createAccountWithEmailAndPassword(
    String email,
    String password,
  );
}
