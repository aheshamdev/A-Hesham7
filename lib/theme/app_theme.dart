import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData buildTheme() {
    const arabicFont = 'NotoNaskhArabic'; // Add in pubspec later

    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: arabicFont,
      ),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      colorScheme: base.colorScheme.copyWith(
        primary: const Color(0xFF0E7490),
        secondary: const Color(0xFF0369A1),
      ),
      cardTheme: const CardTheme(
        elevation: 1,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
    );
  }
}
