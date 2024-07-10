import 'package:flutter/material.dart';

// creating a light mode for the UI
ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
  surface: const Color.fromARGB(255, 54, 52, 52),
  primary: Colors.grey.shade600,
  secondary: Color.fromARGB(255, 116, 113, 113),
  tertiary: Colors.purple.shade300,
  inversePrimary: Colors.grey.shade300,
));
