import 'package:flutter/material.dart';

import '../common/constants.dart';
import 'features/routes.dart';
import 'theme/theme.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteList.dashboard,
      onGenerateRoute: Routes.generateRoute,
      theme: defaultTheme(),
    );
  }
}
