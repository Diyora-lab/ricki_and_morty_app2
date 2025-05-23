import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricki_and_morty_app2/core/config/router/router.dart';
import 'package:ricki_and_morty_app2/core/services/dio_settings.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/data/repository/characters_list_repository.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/usecase/fetch_characters_list_usecase.dart';
import 'package:ricki_and_morty_app2/modules/home/bloc/get_characters_list_bloc.dart';

final appRouter = AppRouter();

void main() {
  runApp(RickiAndMortyApp(
    appRouter: appRouter,
  ));
}

class RickiAndMortyApp extends StatelessWidget {
  const RickiAndMortyApp({required this.appRouter, super.key});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetCharactersListBloc(
              fetchCharactersListUsecase: FetchCharactersListUsecase(
                charactersListRepository:
                    CharactersListRepository(dioSettings: DioSettings()),
              ),
            ),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(),
        ));
  }
}
