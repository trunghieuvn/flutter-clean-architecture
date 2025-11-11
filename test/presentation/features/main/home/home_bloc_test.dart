import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:singapore_mobile_networks/data/entities/record_entity.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/bloc/home_bloc.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/interactor/home_interactor.dart';

import '../../../../helper.dart';
import '../../../../mocks/mocks.dart';

void main() {
  final homeBlocTest = BaseBlocTest<HomeBloc, HomeEvent, HomeState>();
  HomeBloc? homeBloc;
  late HomeInteractor interactor;

  setUp(() {
    interactor = HomInteractorMock();
    homeBloc = HomeBloc(interactor: interactor);
  });

  tearDown(() {
    homeBloc?.close();
  });

  group('Home Bloc Test Get info success', () {
    homeBlocTest
      ..test(
        'should start with [HomeInitial]',
        build: () => homeBloc!,
        expect: () => const <HomeInitial>[],
      )
      ..test(
        'should load data Store success with [LoadDataStoreEvent]',
        build: () => homeBloc!,
        act: (HomeBloc bloc) async {
          when(() => interactor.getDataStore(
              resourceId: 'a807b7ab-6cad-4aa6-87d0-e283a7353a0f',
              limit: 100)).thenAnswer((_) async => <RecordEntity>[]);

          bloc.add(LoadDataStoreEvent());
        },
        wait: const Duration(milliseconds: 100),
        expect: () => <dynamic>[
          isA<LoadDataStoreSuccess>(),
        ],
      )
      ..test(
        'should emit error state when getDataStore fails',
        build: () => homeBloc!,
        act: (HomeBloc bloc) async {
          when(() => interactor.getDataStore(
              resourceId: 'a807b7ab-6cad-4aa6-87d0-e283a7353a0f',
              limit: 100)).thenThrow(Exception('Network error'));

          bloc.add(LoadDataStoreEvent());
        },
        wait: const Duration(milliseconds: 100),
        expect: () => <dynamic>[
          isA<LoadDataStoreError>(),
        ],
      );
  });
}
