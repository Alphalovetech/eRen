import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xFF008080); // deep teal
  static const Color accentColor = Color(0xFF4DB6AC); // lighter teal
  static const Color backgroundColor = Color(0xFFF2F2F2); // off-white

  static ThemeData get theme {
    final base = ThemeData.light();

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: accentColor,
        background: backgroundColor,
        brightness: Brightness.light,
      ),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      canvasColor: backgroundColor,
      fontFamily: 'PT Sans',
      textTheme: base.textTheme.copyWith(
        displayLarge: base.textTheme.displayLarge?.copyWith(
          fontFamily: 'Playfair',
        ),
        displayMedium: base.textTheme.displayMedium?.copyWith(
          fontFamily: 'Playfair',
        ),
        displaySmall: base.textTheme.displaySmall?.copyWith(
          fontFamily: 'Playfair',
        ),
        headlineLarge: base.textTheme.headlineLarge?.copyWith(
          fontFamily: 'Playfair',
        ),
        headlineMedium: base.textTheme.headlineMedium?.copyWith(
          fontFamily: 'Playfair',
        ),
        headlineSmall: base.textTheme.headlineSmall?.copyWith(
          fontFamily: 'Playfair',
        ),
        titleLarge: base.textTheme.titleLarge?.copyWith(
          fontFamily: 'Playfair',
        ),
        bodyLarge: base.textTheme.bodyLarge?.copyWith(
          fontFamily: 'PT Sans',
        ),
        bodyMedium: base.textTheme.bodyMedium?.copyWith(
          fontFamily: 'PT Sans',
        ),
        bodySmall: base.textTheme.bodySmall?.copyWith(
          fontFamily: 'PT Sans',
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
