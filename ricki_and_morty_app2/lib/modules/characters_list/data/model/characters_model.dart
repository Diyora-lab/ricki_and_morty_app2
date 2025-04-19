import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';

class CharactersModel extends CharactersEntity {
  CharactersModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.type,
    required super.gender,
    required super.image,
    required super.location,
    required super.episode,
    required super.url,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? 0,
      species: json['species'] ?? '',
      type: json['type'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'] ?? 0,
      location: json['location']['name'],
      episode: json['episode'] ?? 0,
      url: json['url'] ?? 0,
    );
  }
}
