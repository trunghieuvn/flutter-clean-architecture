part of data_manager;

class DataManagerImpl extends DataManager {
  final AppPreferences appPreferences;

  DataManagerImpl({
    @required this.appPreferences,
  });

  @override
  String getDataStore() {
    return appPreferences.getDataStore();
  }

  @override
  void saveDataStore(String data) {
    appPreferences.saveDataStore(data);
  }
}
