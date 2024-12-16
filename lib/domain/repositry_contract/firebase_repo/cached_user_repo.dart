import 'package:firebase_auth/firebase_auth.dart';

abstract class CachedFirebaseUserRepo {
  User? getCachedFirebaseUser();
}
