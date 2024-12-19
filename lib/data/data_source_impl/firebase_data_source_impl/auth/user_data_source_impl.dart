import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/auth/user_data_source.dart';
import 'package:movies_app/data/models/user/user_dto.dart';
import 'package:movies_app/data/services/firebase/auth_services.dart';
import 'package:movies_app/data/services/firebase/firestore_service.dart';

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

@Injectable(as: FireStoreUserDataSource)
class FireStoreUserDataSourceImpl extends FireStoreUserDataSource {
  FireStoreServies fireStoreServies;

  @factoryMethod
  FireStoreUserDataSourceImpl({required this.fireStoreServies});

  @override
  Future<UserDto?> getUserFromFireStore() {
    return fireStoreServies.getUserFromFireStore();
  }
}
