import 'package:dio/dio.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/data/model/characters_model.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/repository/characters_list_domain_repository.dart';

class CharactersListRepository implements CharactersListDomainRepository {
  final _dio = Dio();
  @override
  Future<List<CharactersEntity>> getCharactersList() async {
    final result = await _dio.get('https://rickandmortyapi.com/api/character/');
    final List<dynamic> characters = result.data['results'];
    return characters.map((e) => CharactersModel.fromJson(e)).toList();
  }
}
