import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.grey.shade600,
      secondary: Colors.grey.shade100,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade900,
    ),
    scaffoldBackgroundColor: Colors.grey.shade100,
  );

  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: const Color.fromARGB(255, 105, 105, 105),
      secondary: const Color.fromARGB(255, 15, 15, 15),
      tertiary: const Color.fromARGB(255, 35, 35, 35),
      inversePrimary: Colors.grey.shade300,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 25, 25, 25),
  );
}
