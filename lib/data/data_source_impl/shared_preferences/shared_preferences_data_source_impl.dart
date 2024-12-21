import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/shared_preferences/shared_preferense_data_source.dart';
import 'package:movies_app/data/services/shared_preferences/shared_preferences.dart';

@Injectable(as: SharedPreferenseDataSource)
class SharedPreferencesDataSourceImpl extends SharedPreferenseDataSource {
  AppSharedPreferences sharedPreferences;

  @factoryMethod
  SharedPreferencesDataSourceImpl({required this.sharedPreferences});

  @override
  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  @override
  Future<void> saveBool(String key, bool value) {
    return sharedPreferences.saveBool(key, value);
  }
}
