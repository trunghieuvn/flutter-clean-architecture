import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/datasources/local/data_manager.dart';
import '../injection/injection.dart';

class ComponentsModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<DataManager>(
      DataManagerImpl(
        appPreferences: AppPreferencesImpl(
          sharedPreferences: await SharedPreferences.getInstance(),
        ),
      ),
    );
  }
}
