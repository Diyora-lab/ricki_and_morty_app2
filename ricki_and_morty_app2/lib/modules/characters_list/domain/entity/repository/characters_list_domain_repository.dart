import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';

abstract class CharactersListDomainRepository {
  Future<List<CharactersEntity>> getCharactersList();
}
