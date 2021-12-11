import '../../../data/datasources/remote/gov_api.dart';
import '../../network/dio_client.dart';
import '../injection/injection.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    final dio = await DioClient.setup();

    getIt.registerSingleton(dio);
    getIt.registerSingleton(GovApi(dio, baseUrl: dio.options.baseUrl));
  }
}
