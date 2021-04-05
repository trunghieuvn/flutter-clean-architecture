@TestOn('vm')
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:singapore_mobile_networks/data/entities/record_entity.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/bloc/home_bloc.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/home_page.dart';

import '../../../../mocks/mocks.dart';

void main() {
  HomeBloc homeBlocMock;

  setUp(() async {
    homeBlocMock = HomeBlocMock();
  });

  tearDown(() {
    homeBlocMock.close();
  });

  testWidgets('Should render success LoginScreen with LoadingWidget',
      (WidgetTester tester) async {
    // Given
    final child = BlocProvider(
      create: (context) => homeBlocMock,
      child: HomePage(),
    );

    when(homeBlocMock.state).thenAnswer((_) => HomeInitial());

    // When
    await tester.pumpWidget(MaterialApp(home: child));

    // Then
    expect(find.byKey(const ValueKey('home_LoadingWidget')), findsOneWidget);
  });

  testWidgets('Should render success LoginScreen with Empty Data',
      (WidgetTester tester) async {
    // Given
    final child = BlocProvider(
      create: (context) => homeBlocMock,
      child: HomePage(),
    );

    when(homeBlocMock.state).thenAnswer(
        (realInvocation) => LoadDataStoreSuccess(const <RecordEntity>[]));

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: child,
      ),
    );

    // Then
    expect(find.text('Data Empty'), findsOneWidget);
  });

  testWidgets('Should render success LoginScreen with ListView Data',
      (WidgetTester tester) async {
    // Given
    final child = BlocProvider(
      create: (context) => homeBlocMock,
      child: HomePage(),
    );
    final dataMock = [
      RecordEntity(
        volume_of_mobile_data: '0.1',
        decrease: true,
      ),
      RecordEntity(
        volume_of_mobile_data: '0.1',
        decrease: false,
      ),
    ];
    when(homeBlocMock.state).thenAnswer((_) => LoadDataStoreSuccess(dataMock));

    // When
    await tester.pumpWidget(
      MaterialApp(home: child),
    );

    // Then
    expect(find.byKey(const ValueKey('home_card_0')), findsOneWidget);
    expect(find.byKey(const ValueKey('home_card_1')), findsOneWidget);
  });
}
