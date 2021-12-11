import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/di/injection/injection.dart';
import 'login/login_screen.dart';
import 'main/dashboard/dashboard_screen.dart';
import 'main/home/bloc/home_bloc.dart';
import 'main/home/home_page.dart';

class Routes {
  static const String dashboard = 'dashboard';
  static const String login = 'login';

  static Map<String, WidgetBuilder> _getAll(RouteSettings settings) => {
        Routes.dashboard: (context) => DashboardScreen(
              pages: [
                BlocProvider(
                  create: (context) => getIt<HomeBloc>(),
                  child: const HomePage(),
                ),
              ],
            ),
        Routes.login: (context) => const LoginScreen(),
      };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _builder = _getAll(settings)[settings.name];
    return MaterialPageRoute(
      builder: _builder!,
      settings: settings,
      fullscreenDialog: false,
    );
  }
}
