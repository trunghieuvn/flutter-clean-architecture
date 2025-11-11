import 'dart:async';

import 'package:mocktail/mocktail.dart';
import 'package:singapore_mobile_networks/data/datasources/local/data_manager.dart';
import 'package:singapore_mobile_networks/data/datasources/remote/gov_api.dart';
import 'package:singapore_mobile_networks/data/models/data_store_model.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/bloc/home_bloc.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/interactor/home_interactor.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/interactor/home_repository.dart';

part 'gov_store.dart';

class DataManagerMock extends Mock implements DataManager {}

class GovApiMock extends Mock implements GovApi {}

class HomeBlocMock extends Mock implements HomeBloc {
  final _stateController = StreamController<HomeState>.broadcast();
  HomeState _currentState = HomeInitial();

  HomeBlocMock() {
    _stateController.add(_currentState);
    when(() => state).thenAnswer((_) => _currentState);
    when(() => stream).thenAnswer((_) => _stateController.stream);
    when(close).thenAnswer((_) async {
      await _stateController.close();
    });
  }

  void setState(HomeState newState) {
    _currentState = newState;
    _stateController.add(newState);
    when(() => state).thenAnswer((_) => _currentState);
  }
}

class HomInteractorMock extends Mock implements HomeInteractor {}

class HomeRepositoryMock extends Mock implements HomeRepository {}
