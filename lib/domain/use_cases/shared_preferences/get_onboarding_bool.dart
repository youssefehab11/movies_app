import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repositry_contract/shared_preferences/shared_preferences_repo.dart';

@injectable
class GetOnboardingBoolUseCase {
  SharedPreferencesRepo sharedPreferencesRepo;

  @factoryMethod
  GetOnboardingBoolUseCase({required this.sharedPreferencesRepo});

  bool? execute(String key) {
    return sharedPreferencesRepo.getBool(key);
  }
}
