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
          when(() =>
                  interactor.getDataStore(resourceId: 'resource_id', limit: 0))
              .thenAnswer((_) async => <RecordEntity>[]);

          bloc.add(LoadDataStoreEvent());
        },
        expect: () => <dynamic>[
          isA<LoadDataStoreSuccess>(),
        ],
      );
  });
}
