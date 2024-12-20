import 'package:movies_app/domain/result.dart';

abstract class EditProfileDataSource {
  Future<Result<String>> editProfile(String newName, String newPhone);
}
