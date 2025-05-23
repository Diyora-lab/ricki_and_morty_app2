import 'package:lesson_test/modules/characters_list/data/model/charactres_list_model.dart';

abstract class CharactersListDomainRepository {
  Future<List<CharactresListModel>> getCharactersList();
}
