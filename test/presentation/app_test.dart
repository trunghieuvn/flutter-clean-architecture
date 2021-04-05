import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:singapore_mobile_networks/common/configs/configurations.dart';
import 'package:singapore_mobile_networks/common/di/injection/injection.dart';
import 'package:singapore_mobile_networks/data/datasources/remote/gov_api.dart';
import 'package:singapore_mobile_networks/env.dart';
import 'package:singapore_mobile_networks/presentation/app.dart';

import '../mocks/mocks.dart';

void main() {
  GovApi govApiMock;

  setUp(() async {
    Configurations().setConfigurationValues(environment);
    SharedPreferences.setMockInitialValues({});
    await Injection.inject();

    getIt.unregister<GovApi>();
    govApiMock = GovApiMock();
    getIt.registerSingleton<GovApi>(govApiMock);
  });

  testWidgets('should render application success', (WidgetTester tester) async {
    // Given
    final child = Application();
    when(govApiMock.getDataStore('resource_id', 0))
        .thenAnswer((_) async => dataStoreModelMock);

    // When
    await tester.pumpWidget(child);

    // Then
    expect(find.byType(AppBar), findsOneWidget);
  });
}
