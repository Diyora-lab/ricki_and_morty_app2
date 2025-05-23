import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricki_and_morty_app2/core/config/router/router.gr.dart';
import 'package:ricki_and_morty_app2/core/constants/app_dimensions.dart';
import 'package:ricki_and_morty_app2/core/extensions/double_extension.dart';
import 'package:ricki_and_morty_app2/core/theme/app_colors.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';
import 'package:ricki_and_morty_app2/modules/home/bloc/get_characters_list_bloc.dart';
import 'package:ricki_and_morty_app2/modules/home/widget/search_character_screen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _isList = ValueNotifier<bool>(true);
  final isSearching = ValueNotifier<bool>(false);

  @override
  void initState() {
    context.read<GetCharactersListBloc>().add(
          FetchCharactersListEvent(),
        );
    super.initState();
  }

  @override
  void dispose() {
    isSearching.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0B1E2D),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.all(15),
              child: SizedBox(
                height: AppDimensions.buttonHeight,
                child: SearchCharacterScreen(),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: isSearching,
                builder: (context, value, child) {
                  return BlocBuilder<GetCharactersListBloc,
                          GetCharactersListState<List<CharactersEntity>>>(
                      builder: (context, state) {
                    if (state.status == StateStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state.status == StateStatus.success) {
                      return NotificationListener<ScrollNotification>(
                          onNotification: (scrollInfo) {
                            if (scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                              context
                                  .read<GetCharactersListBloc>()
                                  .add(FetchCharactersListEvent());
                            }
                            return true;
                          },
                          child: Expanded(
                            child: ValueListenableBuilder(
                                valueListenable: _isList,
                                builder: (context, value, child) {
                                  return CustomScrollView(slivers: [
                                    SliverAppBar(
                                      backgroundColor: const Color(0xFF0B1E2D),
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
                                        childAspectRatio: value ? 6 : 0.9,
                                      ),
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          context.router.push(
                                            ProfileCharactersRoute(
                                              characters: state.model?[index] ??
                                                  CharactersEntity.empty(),
                                            ),
                                          );
                                        },
                                        child: value
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 12),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              state
                                                                      .model?[
                                                                          index]
                                                                      .image ??
                                                                  ''),
                                                        ),
                                                      ),
                                                    ),
                                                    AppDimensions.smallPadding
                                                        .horizontalSpace,
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          state.model?[index]
                                                                  .status ??
                                                              '',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green),
                                                        ),
                                                        Text(
                                                          state.model?[index]
                                                                  .name ??
                                                              '',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .textColor),
                                                        ),
                                                        Text(
                                                          state.model?[index]
                                                                  .species ??
                                                              '',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .textColor),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 150,
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            state.model?[index]
                                                                    .image ??
                                                                ''),
                                                      ),
                                                    ),
                                                  ),
                                                  AppDimensions.mediumPadding
                                                      .verticalSpace,
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        state.model?[index]
                                                                .status ??
                                                            '',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      Text(
                                                        state.model?[index]
                                                                .name ??
                                                            '',
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .textColor),
                                                      ),
                                                      Text(
                                                        state.model?[index]
                                                                .species ??
                                                            '',
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .textColor),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                      ),
                                    )
                                  ]);
                                }),
                          ));
                    }
                    return const SizedBox.shrink();
                  });
                }),
          ],
        ),
      ),
    );
  }
}
