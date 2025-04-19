import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';
import 'package:ricki_and_morty_app2/modules/home/bloc/get_characters_list_bloc.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    context.read<GetCharactersListBloc>().add(
          FetchCharactersListEvent(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<GetCharactersListBloc,
                  GetCharactersListState<List<CharactersEntity>>>(
              builder: (context, state) {
            if (state.status == StateStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.status == StateStatus.success) {
              return Expanded(
                  child: ListView.builder(
                itemCount: state.model?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.model?[index].name ?? ''),
                    leading: Image.network(state.model?[index].image ?? ''),
                  );
                },
              ));
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
