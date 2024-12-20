import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/user/user_dto.dart';
import 'package:movies_app/data/services/firebase/auth_exceptions.dart';
import 'package:movies_app/data/services/firebase/firestore_service.dart';
import 'package:movies_app/domain/result.dart';

@singleton
@injectable
class AuthServices {
  final FirebaseAuth _credential = FirebaseAuth.instance;
  FireStoreServies fireStoreServies;
  @factoryMethod
  AuthServices({required this.fireStoreServies});
  Future<Result<UserDto>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    try {
      UserCredential userCredential = await _credential
          .createUserWithEmailAndPassword(email: email, password: password);

      UserDto user = UserDto(
        id: userCredential.user?.uid,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
      );
      fireStoreServies.saveUserToFireStore(user);
      return Success(data: user);
    } on FirebaseException catch (exception) {
      if (exception.code == FirebaseCodes.weakPassword.value) {
        return ServerError(
            success: false, statusMessage: AuthExceptionsMessages.weakPassword);
      }
      if (exception.code == FirebaseCodes.emailAlreadyExists.value) {
        return ServerError(
            success: false,
            statusMessage: AuthExceptionsMessages.emailAlreadyExists);
      }
      return ServerError(statusMessage: exception.toString());
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  Future<Result<UserDto?>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _credential.signInWithEmailAndPassword(
          email: email, password: password);
      UserDto? userDto;
      return Success(data: userDto);
    } on FirebaseAuthException catch (exception) {
      if (exception.code == FirebaseCodes.invalidCredintials.value) {
        return ServerError(
          success: false,
          statusMessage: AuthExceptionsMessages.wrongEmailOrPassword,
        );
      }
      return ServerError(statusMessage: exception.toString());
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  Future<Result<String>> signOut() async {
    try {
      await _credential.signOut();
      return Success(data: 'Successfully Logged Out');
    } on FirebaseAuthException catch (exception) {
      return ServerError(success: false, statusMessage: exception.message);
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  User? getCachedFirebaseUser() {
    return _credential.currentUser;
  }
}
