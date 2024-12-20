import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/firestore/edit_profile_repo.dart';
import 'package:movies_app/domain/result.dart';

@injectable
class EditProfileUseCase {
  EditProfileRepo editProfileRepo;

  @factoryMethod
  EditProfileUseCase({required this.editProfileRepo});

  Future<Result<String>> execute(String newName, String newPhone) {
    return editProfileRepo.editProfile(newName, newPhone);
  }
}
