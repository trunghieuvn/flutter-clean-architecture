import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:singapore_mobile_networks/common/di/injection/injection.dart';
import 'package:singapore_mobile_networks/data/datasources/remote/gov_api.dart';
import 'package:singapore_mobile_networks/presentation/features/main/dashboard/dashboard_screen.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/bloc/home_bloc.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/home_page.dart';

import '../../../mocks/mocks.dart';

void main() {
  GovApi govApiMock;

  setUp(() async {
    govApiMock = GovApiMock();

    SharedPreferences.setMockInitialValues({});
    await Injection.inject();
    getIt.unregister<GovApi>();
    getIt.registerSingleton<GovApi>(govApiMock);
  });

  testWidgets('Should render success DashboardScreen',
      (WidgetTester tester) async {
    // Given
    final child = DashboardScreen(
      pages: [
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
          child: HomePage(),
        ),
      ],
    );
    when(govApiMock.getDataStore('resource_id', 0))
        .thenAnswer((_) async => dataStoreModelMock);

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: child,
      ),
    );

    // Then
    expect(
        find.byKey(const ValueKey('dashboard_IndexedStack')), findsOneWidget);
  });
}
