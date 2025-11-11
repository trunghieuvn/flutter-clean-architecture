import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:singapore_mobile_networks/data/datasources/remote/gov_api.dart';
import 'package:singapore_mobile_networks/data/repositories/gov_repository.dart';
import 'package:singapore_mobile_networks/data/repositories/impl/gov_repository_impl.dart';

import '../../mocks/mocks.dart';

void main() {
  late GovApi govApiMock;
  late GovRepository repository;

  setUp(() {
    govApiMock = GovApiMock();
    repository = GovRepositoryImpl(govApi: govApiMock);
  });

  group('GovRepositoryImpl', () {
    test('should get data store from API', () async {
      // Given
      when(() => govApiMock.getDataStore('resource_id', 100))
          .thenAnswer((_) async => dataStoreModelMock);

      // When
      final result = await repository.getDataStore(
        resourceId: 'resource_id',
        limit: 100,
      );

      // Then
      expect(result, equals(dataStoreModelMock));
      verify(() => govApiMock.getDataStore('resource_id', 100)).called(1);
    });
  });
}
