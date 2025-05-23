import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_test/modules/characters_list/data/model/charactres_list_model.dart';
import 'package:lesson_test/modules/domain/usecase/fetch_characters_usecase.dart';

enum StateStatus {
  init,
  loading,
  success,
  error,
}

class CharactersListBloc extends Bloc<GetCharactersListEvent,
    GetCharactersListState<List<CharactresListModel>>> {
  final FetchCharactersUsecase _fetchCharactersUsecase;
  CharactersListBloc({required FetchCharactersUsecase fetchCharactersUsecase})
      : _fetchCharactersUsecase = fetchCharactersUsecase,
        super(
          const GetCharactersListState.init(),
        ) {
    on<FetchCharactersListEvent>((event, emit) async {
      emit(
        const GetCharactersListState.loading(),
      );
      try {
        final result = await _fetchCharactersUsecase.call();
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
