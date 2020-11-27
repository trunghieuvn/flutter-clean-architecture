part of data_manager;

abstract class AppPreferences {
  void saveDataStore(String data);
  String getDataStore();

  static const String keyDataStore = 'data_store';
}
