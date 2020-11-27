import 'package:get_it/get_it.dart';

import '../modules/api_module.dart';
import '../modules/bloc_module.dart';
import '../modules/components_module.dart';
import '../modules/repository_module.dart';

GetIt getIt = GetIt.instance;

class Injection {
  static Future<void> inject() async {
    await ComponentsModule().provides();
    await ApiModule().provides();
    await RepositoryModule().provides();
    await BlocModule().provides();
  }
}
