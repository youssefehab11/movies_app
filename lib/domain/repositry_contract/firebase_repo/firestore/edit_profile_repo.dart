import 'package:movies_app/domain/result.dart';

abstract class EditProfileRepo {
  Future<Result<String>> editProfile(String newName, String newPhone);
}
