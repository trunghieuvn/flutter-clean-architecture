import 'dart:async';

import 'package:flutter/material.dart';

import 'common/configs/configurations.dart';
import 'common/di/injection/injection.dart';
import 'common/utils.dart';
import 'env.dart';
import 'presentation/app.dart';

void main() {
  Configurations().setConfigurationValues(environment);

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Injection.inject();

    runApp(Application());
  }, (obj, StackTrace stack) {
    LogUtils.d(' ------ main.dart ------');
    LogUtils.d(obj);
    LogUtils.d(stack);
  });
}
