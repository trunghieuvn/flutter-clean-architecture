import '../../../../../data/entities/record_entity.dart';

abstract class HomeInteractor {
  Future<List<RecordEntity>> getDataStore(
      {required String resourceId, required int limit});
}
