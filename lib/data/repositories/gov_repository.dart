import '../models/data_store_model.dart';

abstract class GovRepository {
  Future<DataStoreModel> getDataStore(
      {required String resourceId, required int limit});
}
