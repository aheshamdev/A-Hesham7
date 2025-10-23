import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light();
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: kDarkGreen,
        primary: kDarkGreen,
        secondary: kLightGold,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: kWhite,
      appBarTheme: const AppBarTheme(
        backgroundColor: kWhite,
        foregroundColor: kDarkGreen,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: kDarkGreen,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkGreen,
          foregroundColor: kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      cardTheme: CardTheme(
        color: kWhite,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFFEBEBEB)),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: kLightGold.withOpacity(0.2),
        selectedColor: kLightGold,
        labelStyle: const TextStyle(color: kDarkGreen),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF7F7F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.grey.shade600),
      ),
      textTheme: base.textTheme.apply(
        bodyColor: Colors.black87,
        displayColor: Colors.black87,
      ),
    );
  }
}
