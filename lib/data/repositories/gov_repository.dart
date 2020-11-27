import 'package:flutter/material.dart';

import '../models/data_store_model.dart';

abstract class GovRepository {
  Future<DataStoreModel> getDataStore(
      {@required String resource_id, @required int limit});
}
