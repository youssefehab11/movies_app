import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repositry_contract/shared_preferences/shared_preferences_repo.dart';

@injectable
class SaveOnboardingBoolUseCase {
  SharedPreferencesRepo sharedPreferencesRepo;

  @factoryMethod
  SaveOnboardingBoolUseCase({required this.sharedPreferencesRepo});

  Future<void> execute(String key, bool value) {
    return sharedPreferencesRepo.saveBool(key, value);
  }
}
