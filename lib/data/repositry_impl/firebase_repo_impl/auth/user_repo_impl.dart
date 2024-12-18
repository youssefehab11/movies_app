import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/auth/user_data_source.dart';
import 'package:movies_app/data/models/user/user_dto.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/auth/user_repo.dart';

@Injectable(as: CachedFirebaseUserRepo)
class CachedFirebaseUserRepoImpl extends CachedFirebaseUserRepo {
  CachedFirebaseUserDataSource cachedFirebaseUserDataSource;

  @factoryMethod
  CachedFirebaseUserRepoImpl({required this.cachedFirebaseUserDataSource});
  @override
  User? getCachedFirebaseUser() {
    return cachedFirebaseUserDataSource.getCachedFirebaseUser();
  }
}

@Injectable(as: FireStoreUserRepo)
class FireStroreUserRepoImpl extends FireStoreUserRepo {
  FireStoreUserDataSource fireStoreUserDataSource;

  @factoryMethod
  FireStroreUserRepoImpl({required this.fireStoreUserDataSource});

  @override
  Future<UserEntity?> getFireStoreUser(String userId) async {
    UserDto? userdto =
        await fireStoreUserDataSource.getUserFromFireStore(userId);
    if (userdto != null) {
      UserEntity userEntity = userdto.toUser();
      return userEntity;
    }
    return null;
  }
}
