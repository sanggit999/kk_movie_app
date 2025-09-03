import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightMode = ThemeData(
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.light(
      primary: Colors.grey.shade600,
      secondary: Colors.grey.shade100,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade900,
      error: Colors.red.shade700,
    ),
    scaffoldBackgroundColor: Colors.grey.shade300,
  );

  static ThemeData darkMode = ThemeData(
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.dark(
      primary: const Color.fromARGB(255, 105, 105, 105),
      secondary: const Color.fromARGB(255, 15, 15, 15),
      tertiary: const Color.fromARGB(255, 35, 35, 35),
      inversePrimary: Colors.grey.shade300,
      error: Colors.red.shade700,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 25, 25, 25),
  );
}
