import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/interactor/home_repository.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/interactor/impl/home_interactor_impl.dart';

import '../../../../mocks.dart';
import '../../../../mocks_data/gov_store.dart';

void main() {
  HomeRepository homeRepositoryMock;

  setUp(() {
    homeRepositoryMock = HomeRepositoryMock();
  });

  group('Should get data success ', () {
    test('description', () async {
      // Given
      final interactor = HomeInteractorImpl(
        homeRepository: homeRepositoryMock,
        dataManager: DataManagerMock(),
      );
      when(homeRepositoryMock.getDataStore(
              resource_id: 'resource_id', limit: 0))
          .thenAnswer((realInvocation) async => dataStoreModelMock);

      // When
      final result =
          await interactor.getDataStore(resource_id: 'resource_id', limit: 0);

      // Then
      expect(result != null, true);
    });
  });
}
