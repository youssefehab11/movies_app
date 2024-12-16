import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/cached_user_data_source.dart';
import 'package:movies_app/data/services/firebase/auth_services.dart';

@Injectable(as: CachedFirebaseUserDataSource)
class CachedUserImpl extends CachedFirebaseUserDataSource {
  AuthServices authServices;

  @factoryMethod
  CachedUserImpl({required this.authServices});
  @override
  User? getCachedFirebaseUser() {
    return authServices.getCachedFirebaseUser();
  }
}
