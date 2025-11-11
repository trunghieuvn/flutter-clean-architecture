import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:singapore_mobile_networks/data/datasources/local/data_manager.dart';

void main() {
  late SharedPreferences sharedPreferences;
  late AppPreferences appPreferences;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    appPreferences = AppPreferencesImpl(sharedPreferences: sharedPreferences);
  });

  group('AppPreferencesImpl', () {
    test('should return empty string when data store is not set', () {
      // When
      final result = appPreferences.getDataStore();

      // Then
      expect(result, equals(''));
    });

    test('should save and get data store', () async {
      // Given
      const testData = '{"test": "data"}';

      // When
      appPreferences.saveDataStore(testData);
      final result = appPreferences.getDataStore();

      // Then
      expect(result, equals(testData));
    });

    test('should overwrite existing data store', () async {
      // Given
      const firstData = '{"first": "data"}';
      const secondData = '{"second": "data"}';

      // When
      appPreferences.saveDataStore(firstData);
      appPreferences.saveDataStore(secondData);
      final result = appPreferences.getDataStore();

      // Then
      expect(result, equals(secondData));
    });
  });
}
