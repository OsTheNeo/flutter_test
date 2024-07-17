// lib/data/repositories/cat_repository.dart
import 'package:catbreeds/data/models/cat_breed.dart';
import 'package:catbreeds/data/services/cat_api_service.dart';

class CatRepository {
  final CatApiService _catApiService;

  CatRepository({CatApiService? catApiService})
      : _catApiService = catApiService ?? CatApiService();

  Future<List<CatBreed>> getBreeds() async {
    return await _catApiService.getBreeds();
  }
}