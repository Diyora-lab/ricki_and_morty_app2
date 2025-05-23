import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricki_and_morty_app2/core/base/app_event.dart';
import 'package:ricki_and_morty_app2/core/base/app_state.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/usecase/search_character_usecase.dart';

class SearchCharacterBloc
    extends Bloc<SearchCharacterEvent, AppState<CharactersEntity>> {
  final SearchCharacterUsecase _searchCharacterUsecase;
  SearchCharacterBloc({required SearchCharacterUsecase searchCharacterUsecase})
      : _searchCharacterUsecase = searchCharacterUsecase,
        super(
          AppState.initial(
            CharactersEntity.empty(),
          ),
        ) {
    on<SearchCharacterEvent>((event, emit) async {
      emit(AppState.loading(CharactersEntity.empty()));
      final result = await _searchCharacterUsecase.call(event.name, 0);
      result.resolve(
          onSucceed: (model) => AppState.success(state.model),
          onFailed: (error) => AppState.error(
                CharactersEntity.empty(),
              ));
    });
  }
}

class SearchCharacterEvent extends AppEvent {
  final String name;

  SearchCharacterEvent({required this.name});
}
