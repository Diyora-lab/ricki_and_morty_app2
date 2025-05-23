import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_test/modules/home/bloc/characters_list_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue,
      body: Column(
        children: [
          ValueListenableBuilder(valueListenable: valueListenable,
           builder:(context, value, child){
            return BlocBuilder<CharactersListBloc, GetCharactersListState>(builder: builder)
           }
           ),
        ],
      ),
    );
  }
}