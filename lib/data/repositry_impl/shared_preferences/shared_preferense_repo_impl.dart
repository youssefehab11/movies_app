import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/shared_preferences/shared_preferense_data_source.dart';
import 'package:movies_app/domain/repositry_contract/shared_preferences/shared_preferences_repo.dart';

@Injectable(as: SharedPreferencesRepo)
class SharedPreferencesRepoImpl extends SharedPreferencesRepo {
  SharedPreferenseDataSource sharedPreferenseDataSource;

  @factoryMethod
  SharedPreferencesRepoImpl({required this.sharedPreferenseDataSource});

  @override
  bool? getBool(String key) {
    return sharedPreferenseDataSource.getBool(key);
  }

  @override
  Future<void> saveBool(String key, bool value) {
    return sharedPreferenseDataSource.saveBool(key, value);
  }
}
