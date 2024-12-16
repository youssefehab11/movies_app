import 'package:firebase_auth/firebase_auth.dart';

abstract class CachedFirebaseUserDataSource {
  User? getCachedFirebaseUser();
}
