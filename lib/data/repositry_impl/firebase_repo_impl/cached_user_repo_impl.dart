import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/cached_user_data_source.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/cached_user_repo.dart';

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
