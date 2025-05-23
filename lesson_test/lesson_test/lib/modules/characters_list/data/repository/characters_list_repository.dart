import 'package:dio/dio.dart';
import 'package:lesson_test/modules/characters_list/data/model/charactres_list_model.dart';
import 'package:lesson_test/modules/domain/repository/characters_list_domain_repository.dart';

class CharactersListRepository implements CharactersListDomainRepository {
  final _dio = Dio();

  @override
  Future<List<CharactresListModel>> getCharactersList() async {
    final result =
        await _dio.get(CharactresListModel(name: "", age: "") as String);
    throw UnimplementedError();
  }
}
