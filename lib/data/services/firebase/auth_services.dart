import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/user/user_dto.dart';
import 'package:movies_app/data/services/firebase/auth_exceptions.dart';
import 'package:movies_app/domain/result.dart';

@singleton
class AuthServices {
  final FirebaseAuth _credential = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
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
      saveUserToFireStore(user);
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

  Future<void> saveUserToFireStore(UserDto user) async {
    final docRef = _db
        .collection(UserDto.usersCollection)
        .withConverter(
          fromFirestore: UserDto.fromFirestore,
          toFirestore: (UserDto city, options) => city.toFirestore(),
        )
        .doc(user.id);
    await docRef.set(user);
  }

  Future<Result<UserDto?>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _credential
          .signInWithEmailAndPassword(email: email, password: password);
      UserDto? userDto = await getUserFromFireStore(userCredential);
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

  Future<UserDto?> getUserFromFireStore(UserCredential userCredintial) async {
    final ref = _db
        .collection(UserDto.usersCollection)
        .doc(userCredintial.user?.uid)
        .withConverter(
          fromFirestore: UserDto.fromFirestore,
          toFirestore: (UserDto city, _) => city.toFirestore(),
        );
    final docSnap = await ref.get();
    return docSnap.data();
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
