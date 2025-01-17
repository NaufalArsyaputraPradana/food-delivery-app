import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade200, // Warna latar belakang yang lebih terang
    primary: Colors.grey.shade600, // Warna primer yang lebih gelap
    secondary: Colors.grey.shade50, // Warna sekunder yang lebih terang
    tertiary: Colors.white, // Warna tersier yang sama
    inversePrimary: Colors.grey.shade800, // Warna primer yang terbalik
  ),
);
