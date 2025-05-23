import 'package:flutter/material.dart';

class NoResultPageScreen extends StatelessWidget {
  const NoResultPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_amber_rounded,
          size: 126,
        ),
        Text(
          "Looks like there are no results for character",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Try entering a new character name on the search bar.",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
