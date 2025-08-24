import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get neonTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0A0F1C), // fondo oscuro azul marino
      primaryColor: const Color(0xFFFF007F), // fucsia neón
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF007F),   // fucsia neón
        secondary: Color(0xFF00E5FF), // azul eléctrico
        tertiary: Color(0xFFA3FF00),  // verde lima
        surface: Color(0xFF0A0F1C),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: Color(0xFFFF007F),
          fontWeight: FontWeight.bold,
          fontSize: 32,
          shadows: [
            Shadow(blurRadius: 10, color: Color(0xFFFF007F)),
          ],
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          color: Colors.white70,
          fontSize: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00E5FF), // azul eléctrico
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadowColor: const Color(0xFF00E5FF),
          elevation: 8,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFA3FF00), // verde lima
        foregroundColor: Colors.black,
      ),
    );
  }
}
