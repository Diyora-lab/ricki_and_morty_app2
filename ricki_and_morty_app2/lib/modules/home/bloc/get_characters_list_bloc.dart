import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/usecase/fetch_characters_list_usecase.dart';

enum StateStatus {
  init,
  loading,
  success,
  error;
}

class GetCharactersListBloc extends Bloc<GetCharactersListEvent,
    GetCharactersListState<List<CharactersEntity>>> {
  final FetchCharactersListUsecase _fetchCharactersListUsecase;
  GetCharactersListBloc(
      {required FetchCharactersListUsecase fetchCharactersListUsecase})
      : _fetchCharactersListUsecase = fetchCharactersListUsecase,
        super(
          const GetCharactersListState.init(),
        ) {
    on<FetchCharactersListEvent>((event, emit) async {
      emit(
        const GetCharactersListState.loading(),
      );
      try {
        final result = await _fetchCharactersListUsecase.call();
        emit(GetCharactersListState.success(model: result));
      } catch (e) {
        emit(const GetCharactersListState.error());
      }
    });
  }
}

abstract class GetCharactersListEvent {}

class FetchCharactersListEvent extends GetCharactersListEvent {}

class GetCharactersListState<T> {
  final StateStatus status;
  final T? model;

  GetCharactersListState({required this.status, this.model});

  const GetCharactersListState.init({
    this.status = StateStatus.init,
    this.model,
  });

  const GetCharactersListState.loading({
    this.status = StateStatus.loading,
    this.model,
  });
  const GetCharactersListState.error(
      {this.status = StateStatus.error, this.model});
  const GetCharactersListState.success(
      {this.status = StateStatus.success, required this.model});
}
