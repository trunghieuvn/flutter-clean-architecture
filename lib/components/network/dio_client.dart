import 'dart:async';
import 'package:dio/dio.dart';

import '../../configurations/configurations.dart';

class DioClient {
  static FutureOr<Dio> setup() async {
    final options = BaseOptions(
      responseType: ResponseType.json,
      // validateStatus: (status) {
      //   return true;
      // },
      baseUrl: Configurations.baseUrl,
    );
    final dio = Dio(options);

    /// Unified add authentication request header
    // dio.interceptors.add(AuthInterceptor());

    /// Print Log (production mode removal)
    // if (BuildConfig.get().flavor != Flavor.RELEASE) {
    //   dio.interceptors
    //       .add(LogInterceptor(requestBody: true, responseBody: true));
    // }
    return dio;
  }
}
