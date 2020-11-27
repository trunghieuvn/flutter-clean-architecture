part of '../utils.dart';

class LogUtils {
  static void d(dynamic data) {
    if (Configurations.environment != 'prod') {
      // ignore: avoid_print
      print('[${DateTime.now().toUtc()}] ${data?.toString()}');
    }
  }
}
