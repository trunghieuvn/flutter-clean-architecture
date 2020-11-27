import '../../../data/datasources/local/data_manager.dart';
import '../../../presentation/features/main/home/bloc/home_bloc.dart';
import '../../../presentation/features/main/home/interactor/home_repository.dart';
import '../../../presentation/features/main/home/interactor/impl/home_interactor_impl.dart';
import '../../base.dart';
import '../injection/injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerFactory<HomeBloc>(() => HomeBloc(
          interactor: HomeInteractorImpl(
            homeRepository: getIt<HomeRepository>(),
            dataManager: getIt<DataManager>(),
          ),
        ));
  }
}
