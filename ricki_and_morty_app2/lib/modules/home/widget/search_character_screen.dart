import 'package:flutter/material.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';

class SearchCharacterScreen extends StatefulWidget {
  const SearchCharacterScreen({super.key});

  @override
  State<SearchCharacterScreen> createState() => _SearchCharacterScreenState();
}

class _SearchCharacterScreenState extends State<SearchCharacterScreen> {
  List<CharactersEntity>? _characters;

  final _searchController = TextEditingController();

  void onSearch(String name) async {
    setState(() {
      _characters = _characters;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 23),
            child: SizedBox(
              height: 35,
              child: Center(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  controller: _searchController,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: const BorderSide(color: Colors.white)),
                      hintText: "Search a character",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search))),
                  onSubmitted: onSearch,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
