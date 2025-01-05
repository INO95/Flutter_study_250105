import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 209, 39, 152),
          Color.fromARGB(31, 161, 48, 125),
        ),
      ),
    ),
  );
}
