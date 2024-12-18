import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/domain/entities/user.dart';

abstract class CachedFirebaseUserRepo {
  User? getCachedFirebaseUser();
}

abstract class FireStoreUserRepo {
  Future<UserEntity?> getFireStoreUser(String userId);
}
