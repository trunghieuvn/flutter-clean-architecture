import 'package:flutter/cupertino.dart';

import '../../../../../data/models/data_store_model.dart';
import '../../../../../data/repositories/gov_repository.dart';
import '../interactor/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final GovRepository govRepository;

  HomeRepositoryImpl({
    @required this.govRepository,
  });

  @override
  Future<DataStoreModel> getDataStore({String resource_id, int limit}) {
    return govRepository.getDataStore(resource_id: resource_id, limit: limit);
  }
}
