import '../../../../../data/models/data_store_model.dart';

abstract class HomeRepository {
  Future<DataStoreModel> getDataStore(
      {required String resourceId, required int limit});
}
