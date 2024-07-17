import 'package:flutter_test/flutter_test.dart';
import 'package:catbreeds/data/models/cat_breed.dart';

void main() {
  group('CatBreed', () {
    test('should create a CatBreed from JSON', () {
      final json = <String, dynamic>{
        'id': '1',
        'name': 'Abyssinian',
        'description': "The Abyssinian is easy to care for, and a joy to have in your home. They're affectionate cats and love both people and other animals.",
        'origin': 'Egypt',
        'intelligence': 5,
        'image': <String, dynamic>{'url': 'https://example.com/abyssinian.jpg'},
        'adaptability': 5,
        'life_span': '14 - 15',
      };

      final catBreed = CatBreed.fromJson(json);

      expect(catBreed.id, '1');
      expect(catBreed.name, 'Abyssinian');
      expect(catBreed.origin, 'Egypt');
      expect(catBreed.intelligence, 5);
      expect(catBreed.imageUrl, 'https://example.com/abyssinian.jpg');
      expect(catBreed.adaptability, 5);
      expect(catBreed.lifeSpan, '14 - 15');
    });
  });
}