import '../../../data/datasources/remote/gov_api.dart';
import '../../../data/repositories/gov_repository.dart';
import '../../../data/repositories/impl/gov_repository_impl.dart';
import '../../../presentation/features/main/home/interactor/home_repository.dart';
import '../../../presentation/features/main/home/repositories/home_repository_impl.dart';
import '../injection/injection.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerFactory<GovRepository>(() => GovRepositoryImpl(
          govApi: getIt.get<GovApi>(),
        ));
    getIt.registerFactory<HomeRepository>(() => HomeRepositoryImpl(
          govRepository: getIt.get<GovRepository>(),
        ));
  }
}
