import 'dart:async';

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, '/Homescreen'));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/bg_color.png'),
        Image.asset('assets/images/welcome_foto.png'),
      ],
    );
  }
}
