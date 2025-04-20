import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricki_and_morty_app2/core/theme/app_colors.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';
import 'package:ricki_and_morty_app2/modules/home/bloc/get_characters_list_bloc.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _isList = ValueNotifier<bool>(true);
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
      backgroundColor: const Color(0xFF0B1E2D),
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
                child: ValueListenableBuilder(
                    valueListenable: _isList,
                    builder: (context, value, child) {
                      return CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            backgroundColor: const Color(0xFF0B1E2D),
                            leading: Text(
                              "Count: ${state.model?.length}",
                              style: TextStyle(color: AppColors.textColor),
                            ),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  _isList.value = !_isList.value;
                                },
                                icon: value
                                    ? const Icon(
                                        Icons.list,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.grid_on,
                                        color: Colors.white,
                                      ),
                              ),
                            ],
                          ),
                          SliverGrid.builder(
                            itemCount: state.model?.length ?? 0,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: value ? 1 : 2,
                              childAspectRatio: value ? 6 : 3,
                            ),
                            itemBuilder: (context, index) => ListTile(
                              title: Text(
                                state.model?[index].name ?? '',
                                style: TextStyle(color: AppColors.textColor),
                              ),
                              subtitle: Text(
                                state.model?[index].species ?? '',
                              ),
                              leading: Image.network(
                                  state.model?[index].image ?? ''),
                            ),
                          ),
                        ],
                      );
                    }),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
