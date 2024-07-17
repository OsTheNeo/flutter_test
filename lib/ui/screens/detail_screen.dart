import 'package:flutter/material.dart';
import 'package:catbreeds/data/models/cat_breed.dart';

class DetailScreen extends StatelessWidget {
  final CatBreed breed;

  const DetailScreen({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
      ),
      body: Column(
        children: [
          // Imagen fija en la parte superior
          Container(
            height: MediaQuery.of(context).size.height * 0.4, // 40% de la altura de la pantalla
            width: double.infinity,
            child: Image(
              image: NetworkImage(breed.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/image_not_found.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Contenido scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      breed.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: 8),
                    Text(
                      breed.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 16),
                    _buildInfoRow('Origin', breed.origin),
                    _buildInfoRow('Intelligence', breed.intelligence.toString()),
                    _buildInfoRow('Adaptability', breed.adaptability.toString()),
                    _buildInfoRow('Life Span', breed.lifeSpan),
                    // Puedes agregar más información aquí si es necesario
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}