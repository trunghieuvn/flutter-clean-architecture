import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:singapore_mobile_networks/data/entities/record_entity.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/bloc/home_bloc.dart';
import 'package:singapore_mobile_networks/presentation/features/main/home/home_page.dart';

import '../../../../mocks/mocks.dart';

void main() {
  HomeBlocMock? homeBlocMock;

  setUp(() async {
    homeBlocMock = HomeBlocMock();
  });

  tearDown(() {
    homeBlocMock?.close();
  });

  testWidgets('Should render success LoginScreen with LoadingWidget',
      (WidgetTester tester) async {
    // Given
    homeBlocMock!.setState(HomeInitial());
    final child = BlocProvider<HomeBloc>(
      create: (context) => homeBlocMock!,
      child: const HomePage(),
    );

    // When
    await tester.pumpWidget(MaterialApp(home: child));
    await tester.pump(); // Allow BlocBuilder to rebuild

    // Then
    expect(find.byKey(const ValueKey('home_LoadingWidget')), findsOneWidget);
  });

  testWidgets('Should render success LoginScreen with Empty Data',
      (WidgetTester tester) async {
    // Given
    homeBlocMock!.setState(LoadDataStoreSuccess(const <RecordEntity>[]));
    final child = BlocProvider<HomeBloc>(
      create: (context) => homeBlocMock!,
      child: const HomePage(),
    );

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: child,
      ),
    );
    await tester.pump(); // Allow BlocBuilder to rebuild

    // Then
    expect(find.text('Data Empty'), findsOneWidget);
  });

  testWidgets('Should render success LoginScreen with ListView Data',
      (WidgetTester tester) async {
    // Given
    final dataMock = [
      RecordEntity(
        volumeOfMobileData: '0.1',
        decrease: true,
      ),
      RecordEntity(
        volumeOfMobileData: '0.1',
        decrease: false,
      ),
    ];
    homeBlocMock!.setState(LoadDataStoreSuccess(dataMock));
    final child = BlocProvider<HomeBloc>(
      create: (context) => homeBlocMock!,
      child: const HomePage(),
    );

    // When
    await tester.pumpWidget(
      MaterialApp(home: child),
    );
    await tester.pump(); // Allow BlocBuilder to rebuild

    // Then
    expect(find.byKey(const ValueKey('home_card_0')), findsOneWidget);
    expect(find.byKey(const ValueKey('home_card_1')), findsOneWidget);
  });

  testWidgets('Should render error state with LoadingWidget',
      (WidgetTester tester) async {
    // Given
    homeBlocMock!.setState(LoadDataStoreError('Error message'));
    final child = BlocProvider<HomeBloc>(
      create: (context) => homeBlocMock!,
      child: const HomePage(),
    );

    // When
    await tester.pumpWidget(MaterialApp(home: child));
    await tester.pump(); // Allow BlocBuilder to rebuild

    // Then - error state should show loading widget
    //(as per current implementation)
    expect(find.byKey(const ValueKey('home_LoadingWidget')), findsOneWidget);
  });

  testWidgets('Should render card with red background when decrease is false',
      (WidgetTester tester) async {
    // Given
    final dataMock = [
      RecordEntity(
        volumeOfMobileData: '0.1',
        decrease: false, // This should show red background
      ),
    ];
    homeBlocMock!.setState(LoadDataStoreSuccess(dataMock));
    final child = BlocProvider<HomeBloc>(
      create: (context) => homeBlocMock!,
      child: const HomePage(),
    );

    // When
    await tester.pumpWidget(MaterialApp(home: child));
    await tester.pump(); // Allow BlocBuilder to rebuild

    // Then
    expect(find.byKey(const ValueKey('home_card_0')), findsOneWidget);
    final card = tester.widget<Card>(find.byKey(const ValueKey('home_card_0')));
    expect(card.color, equals(Colors.red.withAlpha(100)));
    expect(find.byIcon(Icons.format_indent_decrease_sharp), findsOneWidget);
  });

  testWidgets('Should render card with white background when decrease is true',
      (WidgetTester tester) async {
    // Given
    final dataMock = [
      RecordEntity(
        volumeOfMobileData: '0.1',
        decrease: true, // This should show white background
      ),
    ];
    homeBlocMock!.setState(LoadDataStoreSuccess(dataMock));
    final child = BlocProvider<HomeBloc>(
      create: (context) => homeBlocMock!,
      child: const HomePage(),
    );

    // When
    await tester.pumpWidget(MaterialApp(home: child));
    await tester.pump(); // Allow BlocBuilder to rebuild

    // Then
    expect(find.byKey(const ValueKey('home_card_0')), findsOneWidget);
    final card = tester.widget<Card>(find.byKey(const ValueKey('home_card_0')));
    expect(card.color, equals(Colors.white));
    expect(find.byIcon(Icons.format_indent_decrease_sharp), findsNothing);
  });
}
