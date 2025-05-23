import 'package:ricki_and_morty_app2/core/base/base_response.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';

abstract class CharactersListDomainRepository {
  Future<BaseResponse<CharactersEntity>> getCharactersList(
      String? name, int page);
}
