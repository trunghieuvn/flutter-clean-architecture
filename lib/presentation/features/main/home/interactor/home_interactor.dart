import 'package:flutter/material.dart';
import '../../../../../data/entities/record_entity.dart';

abstract class HomeInteractor {
  Future<List<RecordEntity>> getDataStore(
      {@required String resource_id, @required int limit});
}
