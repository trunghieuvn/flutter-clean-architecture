import 'dart:async';

import 'package:flutter/material.dart';

import 'components/di/injection/injection.dart';
import 'configurations/configurations.dart';
import 'env.dart';
import 'presentation/app.dart';

void main() {
  Configurations().setConfigurationValues(environment);

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    await Injection.inject();

    runApp(const Application());
  }, (obj, StackTrace stack) {
    LogUtils.d(' ------ main.dart ------');
    LogUtils.d(obj);
    LogUtils.d(stack);
  });
}
