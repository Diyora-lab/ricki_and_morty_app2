import 'package:ricki_and_morty_app2/core/base/base_response.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/data/repository/characters_list_repository.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';

class FetchCharactersListUsecase {
  final CharactersListRepository _charactersListRepository;
  FetchCharactersListUsecase(
      {required CharactersListRepository charactersListRepository})
      : _charactersListRepository = charactersListRepository;

  Future<BaseResponse<CharactersEntity>> call() async {
    return await _charactersListRepository.getCharactersList(null, 0);
  }
}
