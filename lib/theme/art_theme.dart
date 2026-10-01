import 'package:flutter/material.dart';

class AppTheme {
  // Artfolio color palette
  static const background = Color(0xFFF8F6F2);
  static const surface = Colors.white;

  static const darkBrown = Color(0xFF302326);
  static const brown = Color(0xFF3B292C);

  static const mutedText = Color(0xFF806F73);
  static const lightText = Color(0xFF8A777B);

  static const pink = Color(0xFFC04F70);
  static const dustyPink = Color(0xFFB76E79);
  static const softPink = Color(0xFFF4E5E7);
  static const borderPink = Color(0xFFE8DADD);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: dustyPink,
      surface: surface,
    ),

    fontFamily: 'Arial',

    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      foregroundColor: darkBrown,
      elevation: 0,
    ),

    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: surface,
      indicatorColor: softPink,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: borderPink,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: borderPink,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: dustyPink,
          width: 1.5,
        ),
      ),
    ),
  );
}