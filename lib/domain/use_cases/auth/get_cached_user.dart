import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/cached_user_repo.dart';

@injectable
class GetCachedFirebaseUserUseCase {
  CachedFirebaseUserRepo cachedFirebaseUserRepo;

  @factoryMethod
  GetCachedFirebaseUserUseCase({required this.cachedFirebaseUserRepo});

  User? execute() {
    return cachedFirebaseUserRepo.getCachedFirebaseUser();
  }
}
