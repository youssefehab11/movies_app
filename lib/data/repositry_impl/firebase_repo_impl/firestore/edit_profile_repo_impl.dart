import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/firestore/edit_profile_data_source.dart';
import 'package:movies_app/domain/repositry_contract/firebase_repo/firestore/edit_profile_repo.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl extends EditProfileRepo {
  EditProfileDataSource editProfileDataSource;

  @factoryMethod
  EditProfileRepoImpl({required this.editProfileDataSource});

  @override
  Future<Result<String>> editProfile(String newName, String newPhone) {
    return editProfileDataSource.editProfile(newName, newPhone);
  }
}
