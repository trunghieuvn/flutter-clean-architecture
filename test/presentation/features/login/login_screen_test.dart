import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:singapore_mobile_networks/presentation/features/login/login_screen.dart';

void main() {
  testWidgets('Should render success LoginScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );
  });
}
