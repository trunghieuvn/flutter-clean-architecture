import 'package:flutter_test/flutter_test.dart';

import 'package:singapore_mobile_networks/configurations/configurations.dart';

void main() {
  group('Configurations', () {
    tearDown(() {
      // Reset to default values
      Configurations().setConfigurationValues({
        'environment': 'dev',
        'baseUrl': 'https://data.gov.sg/api/',
      });
    });

    test('should set and get environment', () {
      // Given
      const testEnvironment = 'test';

      // When
      Configurations().setConfigurationValues({
        'environment': testEnvironment,
        'baseUrl': 'https://test.com/',
      });

      // Then
      expect(Configurations.environment, equals(testEnvironment));
    });

    test('should set and get baseUrl', () {
      // Given
      const testBaseUrl = 'https://test-api.com/';

      // When
      Configurations().setConfigurationValues({
        'environment': 'dev',
        'baseUrl': testBaseUrl,
      });

      // Then
      expect(Configurations.baseUrl, equals(testBaseUrl));
    });
  });

  group('LogUtils', () {
    test('should log when environment is not prod', () {
      // Given
      Configurations().setConfigurationValues({
        'environment': 'dev',
        'baseUrl': 'https://test.com/',
      });

      // When/Then - should not throw
      expect(() => LogUtils.d('test message'), returnsNormally);
    });
  });
}

