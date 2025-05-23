import 'package:lesson_test/modules/characters_list/data/model/charactres_list_model.dart';
import 'package:lesson_test/modules/characters_list/data/repository/characters_list_repository.dart';

class FetchCharactersUsecase {
  final CharactersListRepository _charactersListRepository;
  FetchCharactersUsecase(
      {required CharactersListRepository charactersListRepository})
      : _charactersListRepository = charactersListRepository;

  Future<List<CharactresListModel>> execute() {
    return _charactersListRepository.getCharactersList();
  }
}
