import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:singapore_mobile_networks/data/models/data_store_model.dart';
import 'package:singapore_mobile_networks/data/repositories/gov_repository.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/interactor/home_repository.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/repositories/home_repository_impl.dart';

import '../../../../../mocks/mocks.dart';

class GovRepositoryMock extends Mock implements GovRepository {}

void main() {
  late GovRepository govRepositoryMock;
  late HomeRepository repository;

  setUp(() {
    govRepositoryMock = GovRepositoryMock();
    repository = HomeRepositoryImpl(govRepository: govRepositoryMock);
  });

  group('HomeRepositoryImpl', () {
    test('should get data store from gov repository', () async {
      // Given
      when(() => govRepositoryMock.getDataStore(
              resourceId: 'resource_id', limit: 100))
          .thenAnswer((_) async => dataStoreModelMock);

      // When
      final result = await repository.getDataStore(
        resourceId: 'resource_id',
        limit: 100,
      );

      // Then
      expect(result, equals(dataStoreModelMock));
      verify(() => govRepositoryMock.getDataStore(
              resourceId: 'resource_id', limit: 100))
          .called(1);
    });
  });
}

