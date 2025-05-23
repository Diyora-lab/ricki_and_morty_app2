import 'package:ricki_and_morty_app2/core/base/base_response.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/repository/characters_list_domain_repository.dart';

class SearchCharacterUsecase {
  final CharactersListDomainRepository _characterRepository;
  SearchCharacterUsecase(this._characterRepository);
  Future<BaseResponse<CharactersEntity>> call(String name, dynamic o) async {
    return await _characterRepository.getCharactersList(name, o);
  }
}
