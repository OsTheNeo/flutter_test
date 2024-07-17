import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catbreeds/ui/widgets/search_bar.dart';

void main() {
  testWidgets('CustomSearchBar updates on text change', (WidgetTester tester) async {
    String searchQuery = '';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomSearchBar(
          onSearch: (query) {
            searchQuery = query;
          },
        ),
      ),
    ));

    await tester.enterText(find.byType(TextField), 'Siamese');
    await tester.pump();

    expect(searchQuery, equals('Siamese'));
  });
}
