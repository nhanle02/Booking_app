
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme.light(
    secondary: Colors.blueAccent,
    inversePrimary: Colors.white,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme.dark(
    secondary: Colors.blueAccent,
    inversePrimary: Colors.black,
  ),
);