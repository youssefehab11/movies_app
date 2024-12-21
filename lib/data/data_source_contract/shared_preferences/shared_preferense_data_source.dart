abstract class SharedPreferenseDataSource {
  Future<void> saveBool(String key, bool value);
  bool? getBool(String key);
}
