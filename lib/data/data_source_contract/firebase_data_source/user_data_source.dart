import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/data/models/user/user_dto.dart';

abstract class CachedFirebaseUserDataSource {
  User? getCachedFirebaseUser();
}

abstract class FireStoreUserDataSource {
  Future<UserDto?> getUserFromFireStore(String userId);
}
