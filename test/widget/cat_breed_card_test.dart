import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catbreeds/data/models/cat_breed.dart';
import 'package:catbreeds/ui/widgets/cat_breed_card.dart';

void main() {
  testWidgets('CatBreedCard displays correct information', (WidgetTester tester) async {
    final catBreed = CatBreed(
      id: '1',
      name: 'Abyssinian',
      description: 'The Abyssinian is easy to care for, and a joy to have in your home.',
      origin: 'Egypt',
      intelligence: 5,
      imageUrl: 'https://example.com/abyssinian.jpg',
      adaptability: 5,
      lifeSpan: '14 - 15',
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CatBreedCard(breed: catBreed),
      ),
    ));

    expect(find.text('Abyssinian'), findsOneWidget);
    expect(find.text('Origen: Egypt'), findsOneWidget);
    expect(find.text('Inteligencia: 5'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}