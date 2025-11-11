import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:singapore_mobile_networks/components/network/dio_client.dart';
import 'package:singapore_mobile_networks/configurations/configurations.dart';
import 'package:singapore_mobile_networks/env.dart';

void main() {
  setUp(() {
    Configurations().setConfigurationValues(environment);
  });

  group('DioClient', () {
    test('should setup Dio with correct baseUrl', () async {
      // When
      final dio = await DioClient.setup();

      // Then
      expect(dio, isA<Dio>());
      expect(dio.options.baseUrl, equals(Configurations.baseUrl));
      expect(dio.options.responseType, equals(ResponseType.json));
    });
  });
}
