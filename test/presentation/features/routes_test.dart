import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:singapore_mobile_networks/components/di/injection/injection.dart';
import 'package:singapore_mobile_networks/presentation/features/login/login_screen.dart';
import 'package:singapore_mobile_networks/presentation/features/main/dashboard/dashboard_screen.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/bloc/home_bloc.dart';
import 'package:singapore_mobile_networks/presentation/features/routes.dart';

import '../../mocks/mocks.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    getIt.registerFactory<HomeBloc>(() {
      final interactor = HomInteractorMock();
      when(() => interactor.getDataStore(
            resourceId: any(named: 'resourceId'),
            limit: any(named: 'limit'),
          )).thenAnswer((_) async => []);
      return HomeBloc(interactor: interactor);
    });
  });

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('should generate login route', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.login,
    ));

    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('should generate dashboard route', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.dashboard,
    ));

    await tester.pumpAndSettle();

    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
