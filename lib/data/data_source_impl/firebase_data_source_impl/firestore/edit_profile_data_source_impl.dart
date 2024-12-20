import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/firebase_data_source/firestore/edit_profile_data_source.dart';
import 'package:movies_app/data/services/firebase/firestore_service.dart';
import 'package:movies_app/domain/result.dart';

@Injectable(as: EditProfileDataSource)
class EditProfileDataSourceImpl extends EditProfileDataSource {
  FireStoreServies fireStoreServies;

  @factoryMethod
  EditProfileDataSourceImpl({required this.fireStoreServies});

  @override
  Future<Result<String>> editProfile(String newName, String newPhone) {
    return fireStoreServies.editProfile(newName, newPhone);
  }
}
