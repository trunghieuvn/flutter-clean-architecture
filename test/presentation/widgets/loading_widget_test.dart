import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:singapore_mobile_networks/presentation/widgets/loading_widget.dart';

void main() {
  group('LoadingWidget', () {
    testWidgets('should render CupertinoActivityIndicator', (tester) async {
      // Given
      const widget = LoadingWidget();

      // When
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );

      // Then
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(find.byKey(const ValueKey('home_LoadingWidget')), findsOneWidget);
    });
  });
}
