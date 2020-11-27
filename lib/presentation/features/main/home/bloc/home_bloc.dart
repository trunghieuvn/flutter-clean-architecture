import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../data/entities/record_entity.dart';
import '../interactor/home_interactor.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeInteractor interactor;

  HomeBloc({
    @required this.interactor,
  }) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    switch (event.runtimeType) {
      case LoadDataStoreEvent:
        yield* _mapLoadDataStoreEventState(event);
        break;
    }
  }

  Stream<HomeState> _mapLoadDataStoreEventState(
      LoadDataStoreEvent event) async* {
    try {
      final data = await interactor.getDataStore(
        resource_id: 'a807b7ab-6cad-4aa6-87d0-e283a7353a0f',
        limit: 100,
      );
      yield LoadDataStoreSuccess(data);
    } catch (error) {
      yield LoadDataStoreError(error.toString());
    }
  }
}
