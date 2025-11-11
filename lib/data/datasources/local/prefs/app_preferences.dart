// ignore_for_file: use_string_in_part_of_directives

part of data_manager;

abstract class AppPreferences {
  void saveDataStore(String data);
  String getDataStore();

  static const String keyDataStore = 'data_store';
}
