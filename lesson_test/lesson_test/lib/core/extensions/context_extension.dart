import 'package:flutter/material.dart';

extension BuildContextExtentsion on BuildContext {
  void push(Widget screen) => Navigator.push(
        this,
        MaterialPageRoute(builder: (context) => screen),
      );

  Size get mq => MediaQuery.of(this).size;
}
