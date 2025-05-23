import 'package:ricki_and_morty_app2/core/base/base_response.dart';
import 'package:ricki_and_morty_app2/core/services/dio_settings.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/data/model/characters_model.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/repository/characters_list_domain_repository.dart';

class CharactersListRepository implements CharactersListDomainRepository {
  final DioSettings _dioSettings;

  CharactersListRepository({required DioSettings dioSettings})
      : _dioSettings = dioSettings;

  @override
  Future<BaseResponse<CharactersEntity>> getCharactersList(
      String? name, int page) async {
    final result = await _dioSettings.dio
        .get('https://rickandmortyapi.com/api/character/');

    final json = result.data;
    return BaseResponse(
        statusCode: result.statusCode ?? 0,
        message: result.statusMessage ?? '',
        data: CharactersModel.fromJson(json));
  }
}
