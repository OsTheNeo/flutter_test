import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:catbreeds/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the first cat breed and verify detail screen',
            (WidgetTester tester) async {
          app.main();
          await tester.pumpAndSettle(const Duration(seconds: 10)); // Increased timeout

          // Verify that we are on the landing screen
          expect(find.text('Catbreeds'), findsOneWidget);

          // Wait for the cat breeds to load
          await tester.pumpAndSettle(const Duration(seconds: 10)); // Increased timeout

          // Find and tap on the first "Más..." button
          final masButton = find.text('Más...');
          expect(masButton, findsAtLeastNWidgets(1));
          await tester.tap(masButton.first);
          await tester.pumpAndSettle(const Duration(seconds: 5));

          // Verify that we are on the detail screen
          expect(find.byType(Image), findsOneWidget);

          // Use more flexible matchers for the text
          expect(find.textContaining('Origen', findRichText: true), findsOneWidget);
          expect(find.textContaining('Inteligencia', findRichText: true), findsOneWidget);
        });
  });
}