import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:catbreeds/data/models/cat_breed.dart';
import 'package:catbreeds/utils/constants.dart';

class CatApiService {
  Future<List<CatBreed>> getBreeds() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/breeds'),
        headers: {'x-api-key': ApiConstants.apiKey},
      );

      if (response.statusCode == 200) {
        List<dynamic> breedsJson = json.decode(response.body);
        return breedsJson.map((json) => CatBreed.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load cat breeds');
      }
    } catch (e) {
      throw Exception('Error fetching cat breeds: $e');
    }
  }
}