import 'package:flutter/material.dart';

import '../../../../../../data/models/data_store_model.dart';
import '../home_interactor.dart';
import '../home_repository.dart';

class HomeInteractorImpl extends HomeInteractor {
  final HomeRepository homeRepository;

  HomeInteractorImpl({
    @required this.homeRepository,
  });

  @override
  Future<DataStoreModel> getDataStore({String resource_id, int limit}) {
    return homeRepository.getDataStore(resource_id: resource_id, limit: limit);
  }
}
