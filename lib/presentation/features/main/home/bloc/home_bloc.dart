import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/entities/record_entity.dart';
import '../interactor/home_interactor.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeInteractor interactor;

  HomeBloc({
    required this.interactor,
  }) : super(HomeInitial()) {
    on<LoadDataStoreEvent>(_mapLoadDataStoreEventState);
  }

  Future<void> _mapLoadDataStoreEventState(
      LoadDataStoreEvent event, Emitter<HomeState> emit) async {
    try {
      final data = await interactor.getDataStore(
        resourceId: 'a807b7ab-6cad-4aa6-87d0-e283a7353a0f',
        limit: 100,
      );
      emit(LoadDataStoreSuccess(data));
    } catch (error) {
      emit(LoadDataStoreError(error.toString()));
    }
  }
}
