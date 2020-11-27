import 'package:flutter/material.dart';

import '../../datasources/remote/gov_api.dart';
import '../../models/data_store_model.dart';
import '../gov_repository.dart';

class GovRepositoryImpl extends GovRepository {
  final GovApi govApi;

  GovRepositoryImpl({
    @required this.govApi,
  });

  @override
  Future<DataStoreModel> getDataStore({String resource_id, int limit}) {
    return govApi.getDataStore(resource_id, limit);
  }
}
