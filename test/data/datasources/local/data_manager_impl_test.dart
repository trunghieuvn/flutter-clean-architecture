import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:singapore_mobile_networks/data/datasources/local/data_manager.dart';

class AppPreferencesMock extends Mock implements AppPreferences {}

void main() {
  late AppPreferences appPreferencesMock;
  late DataManager dataManager;

  setUp(() {
    appPreferencesMock = AppPreferencesMock();
    dataManager = DataManagerImpl(appPreferences: appPreferencesMock);
  });

  group('DataManagerImpl', () {
    test('should get data store from app preferences', () {
      // Given
      const testData = 'test data';
      when(() => appPreferencesMock.getDataStore()).thenReturn(testData);

      // When
      final result = dataManager.getDataStore();

      // Then
      expect(result, equals(testData));
      verify(() => appPreferencesMock.getDataStore()).called(1);
    });

    test('should save data store to app preferences', () {
      // Given
      const testData = 'test data to save';
      when(() => appPreferencesMock.saveDataStore(testData)).thenReturn(null);

      // When
      dataManager.saveDataStore(testData);

      // Then
      verify(() => appPreferencesMock.saveDataStore(testData)).called(1);
    });
  });
}
