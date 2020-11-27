import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:singapore_mobile_networks/common/di/injection/injection.dart';
import 'package:singapore_mobile_networks/presentation/app.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Injection.inject();
  });

  testWidgets('should render application success', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Application());

    // // Verify that our counter starts at 0.
    // expect(find.byType(Text), findsOneWidget);
  });
}
