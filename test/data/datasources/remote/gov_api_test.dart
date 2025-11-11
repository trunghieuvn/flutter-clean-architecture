import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:singapore_mobile_networks/data/datasources/remote/gov_api.dart';

import '../../../mocks/mocks.dart';

class DioMock extends Mock implements Dio {}

void main() {
  setUpAll(() {
    registerFallbackValue(RequestOptions(path: '/'));
  });

  late Dio dio;
  late GovApi api;
  late BaseOptions baseOptions;

  setUp(() {
    dio = DioMock();
    baseOptions = BaseOptions(baseUrl: 'https://example.com/');
    when(() => dio.options).thenReturn(baseOptions);
    api = GovApi(dio);
  });

  test('should fetch data from dio and parse to model', () async {
    final responseData = jsonDecode(jsonEncode(dataStoreModelMock.toJson()))
        as Map<String, dynamic>;

    when(() => dio.fetch<Map<String, dynamic>>(any()))
        .thenAnswer((invocation) async {
      final requestOptions =
          invocation.positionalArguments.first as RequestOptions;
      expect(requestOptions.path, contains('action/datastore_search'));
      return Response<Map<String, dynamic>>(
        data: responseData,
        requestOptions: requestOptions,
      );
    });

    final result = await api.getDataStore('resource_id', 10);

    expect(
        result.result.records.length, dataStoreModelMock.result.records.length);
  });
}
