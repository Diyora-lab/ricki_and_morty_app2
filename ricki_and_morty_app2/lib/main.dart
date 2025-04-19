import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/data/repository/characters_list_repository.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/usecase/fetch_characters_list_usecase.dart';
import 'package:ricki_and_morty_app2/modules/home/bloc/get_characters_list_bloc.dart';
import 'package:ricki_and_morty_app2/modules/home/home_screen.dart';

void main() {
  runApp(const RickiAndMortyApp());
}

class RickiAndMortyApp extends StatelessWidget {
  const RickiAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetCharactersListBloc(
              fetchCharactersListUsecase: FetchCharactersListUsecase(
                charactersListRepository: CharactersListRepository(),
              ),
            ),
        child: const MaterialApp(
          home: Homescreen(),
        ));
  }
}
