import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart'; // Changed to mocktail
import 'package:catbreeds/data/repositories/cat_repository.dart';
import 'package:catbreeds/blocs/bloc.dart';
import 'package:catbreeds/data/models/cat_breed.dart';

class MockCatRepository extends Mock implements CatRepository {}

void main() {
  group('CatBreedsBloc', () {
    late CatBreedsBloc catBreedsBloc;
    late MockCatRepository mockCatRepository;

    setUp(() {
      mockCatRepository = MockCatRepository();
      catBreedsBloc = CatBreedsBloc(mockCatRepository);
    });

    tearDown(() {
      catBreedsBloc.close();
    });

    test('initial state is CatBreedsInitial', () {
      expect(catBreedsBloc.state, isA<CatBreedsInitial>());
    });

    blocTest<CatBreedsBloc, CatBreedsState>(
      'emits [CatBreedsLoading, CatBreedsLoaded] when FetchCatBreeds is added',
      build: () {
        when(() => mockCatRepository.getBreeds()).thenAnswer((_) async => [
          CatBreed(id: '1', name: 'Abyssinian', description: '', origin: 'Egypt', intelligence: 5, imageUrl: '', adaptability: 5, lifeSpan: '14 - 15'),
        ]);
        return catBreedsBloc;
      },
      act: (bloc) => bloc.add(FetchCatBreeds()),
      expect: () => [
        isA<CatBreedsLoading>(),
        isA<CatBreedsLoaded>(),
      ],
    );
  });
}