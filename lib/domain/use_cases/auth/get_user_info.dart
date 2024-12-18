import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/user.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/auth/user_repo.dart';

@injectable
class GetUserInfoUseCase {
  FireStoreUserRepo fireStoreUserRepo;
  @factoryMethod
  GetUserInfoUseCase({required this.fireStoreUserRepo});

  Future<UserEntity?> execute(String userId) {
    return fireStoreUserRepo.getFireStoreUser(userId);
  }
}
