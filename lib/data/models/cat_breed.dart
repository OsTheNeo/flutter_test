import 'package:equatable/equatable.dart';

class CatBreed extends Equatable {
  final String id;
  final String name;
  final String description;
  final String origin;
  final int intelligence;
  final String imageUrl;
  final int adaptability;
  final String lifeSpan;

  CatBreed({
    required this.id,
    required this.name,
    required this.description,
    required this.origin,
    required this.intelligence,
    required this.imageUrl,
    required this.adaptability,
    required this.lifeSpan,
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    return CatBreed(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      origin: json['origin'],
      intelligence: json['intelligence'],
      imageUrl: json['image']?['url'] ?? '',
      adaptability: json['adaptability'],
      lifeSpan: json['life_span'],
    );
  }

  @override
  List<Object> get props => [id, name, origin, intelligence];
}