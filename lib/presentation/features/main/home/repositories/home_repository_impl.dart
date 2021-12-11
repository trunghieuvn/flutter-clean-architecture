import '../../../../../data/models/data_store_model.dart';
import '../../../../../data/repositories/gov_repository.dart';
import '../interactor/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final GovRepository govRepository;

  HomeRepositoryImpl({
    required this.govRepository,
  });

  @override
  Future<DataStoreModel> getDataStore(
      {required String resourceId, required int limit}) {
    return govRepository.getDataStore(resourceId: resourceId, limit: limit);
  }
}
