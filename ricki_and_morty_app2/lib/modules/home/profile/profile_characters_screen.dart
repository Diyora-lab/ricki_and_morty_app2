import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ricki_and_morty_app2/modules/characters_list/domain/entity/characters_entity.dart';

@RoutePage()
class ProfileCharactersScreen extends StatelessWidget {
  const ProfileCharactersScreen({required this.characters, super.key});
  final CharactersEntity characters;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1E2D),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0B1E2D),
      body: Stack(
        children: [
          buildCoverImage(screenSize),
          SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height / 4.2,
                ),
                buildProfiImage(),
                Text(
                  characters.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 34),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    characters.status,
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 22, right: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Gender:",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(
                        width: 160,
                      ),
                      Text(
                        "Human:",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 22, right: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        characters.gender,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 172,
                      ),
                      Text(
                        characters.species,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 22, right: 45),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Location:",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 22, right: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        characters.location,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 2.9,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(characters.image), fit: BoxFit.cover),
      ),
    );
  }

  Widget buildProfiImage() {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          image: DecorationImage(
            image: NetworkImage(characters.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: const Color(0xFF0B1E2D), width: 5),
        ),
      ),
    );
  }
}
