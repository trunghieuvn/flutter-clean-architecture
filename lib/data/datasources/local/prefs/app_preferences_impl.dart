part of data_manager;

class AppPreferencesImpl extends AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferencesImpl({
    @required this.sharedPreferences,
  });

  @override
  String getDataStore() {
    return sharedPreferences.getString(AppPreferences.keyDataStore);
  }

  @override
  void saveDataStore(String data) {
    sharedPreferences.setString(AppPreferences.keyDataStore, data);
  }
}
