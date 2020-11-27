import '../../../presentation/features/main/home/bloc/home_bloc.dart';
import '../../base.dart';
import '../injection/injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerFactory<HomeBloc>(() => HomeBloc());
  }
}
