import 'package:flutter/material.dart';

final ThemeData lightAppTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color.fromARGB(255, 0, 35, 102)),
  useMaterial3: false,
);

final ThemeData darkAppTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 0, 35, 102)),
  useMaterial3: false,
);
