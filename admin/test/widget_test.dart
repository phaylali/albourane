import 'package:flutter_test/flutter_test.dart';
import 'package:admin/main.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('App builds and starts', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Start());

    // Verify that our app builds.
    expect(find.byType(GetMaterialApp), findsOneWidget);
  });
}
