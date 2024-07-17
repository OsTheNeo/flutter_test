import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart'; // Changed to mocktail
import 'package:catbreeds/data/models/cat_breed.dart';
import 'package:catbreeds/data/repositories/cat_repository.dart';
import 'package:catbreeds/data/services/cat_api_service.dart';

class MockCatApiService extends Mock implements CatApiService {}

void main() {
  late CatRepository repository;
  late MockCatApiService mockApiService;

  setUp(() {
    mockApiService = MockCatApiService();
    repository = CatRepository(catApiService: mockApiService);
  });

  group('CatRepository', () {
    test('getBreeds returns list of CatBreed', () async {
      final breeds = [
        CatBreed(
          id: '1',
          name: 'Abyssinian',
          description: 'Active and energetic',
          origin: 'Egypt',
          intelligence: 5,
          imageUrl: 'https://example.com/abyssinian.jpg',
          adaptability: 5,
          lifeSpan: '14 - 15',
        ),
      ];

      when(() => mockApiService.getBreeds()).thenAnswer((_) async => breeds);

      final result = await repository.getBreeds();

      expect(result, equals(breeds));
      verify(() => mockApiService.getBreeds()).called(1);
    });
  });
}
