import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/services/firebase/auth_exceptions.dart';
import 'package:movies_app/domain/result.dart';

@singleton
class AuthServices {
  final FirebaseAuth _credential = FirebaseAuth.instance;
  Future<Result<UserCredential>> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _credential
          .createUserWithEmailAndPassword(email: email, password: password);
      return Success(data: userCredential);
    } on FirebaseException catch (exception) {
      if (exception.code == AuthExceptions.weakPassword.value) {
        return ServerError(
            success: false,
            statusMessage: 'The password provided is too weak.');
      }
      if (exception.code == AuthExceptions.emailAlreadyExists.value) {
        return ServerError(
            success: false,
            statusMessage: 'The account already exists for that email.');
      }
      return ServerError(statusMessage: exception.toString());
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }
}
