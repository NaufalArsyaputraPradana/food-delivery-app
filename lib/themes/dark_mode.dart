import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(
        255, 25, 25, 25), // Warna latar belakang yang lebih gelap
    primary:
        Color.fromARGB(255, 150, 150, 150), // Warna primer yang lebih terang
    secondary:
        Color.fromARGB(255, 40, 40, 40), // Warna sekunder yang lebih gelap
    tertiary:
        Color.fromARGB(255, 60, 60, 60), // Warna tersier yang lebih terang
    inversePrimary: Colors.grey.shade300, // Warna primer yang terbalik
  ),
);
