import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(ColorScheme? lightColorScheme) {
    ColorScheme scheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF41A64C), background: Colors.grey.shade200);
    return ThemeData(
      colorScheme: scheme,
      dialogBackgroundColor: Colors.green.shade200,
      dialogTheme: DialogTheme(
          backgroundColor: Colors.grey.shade200,
          surfaceTintColor: Colors.grey.shade200),
    );
  }

  static ThemeData darkTheme(ColorScheme? darkColorScheme) {
    // ColorScheme scheme = darkColorScheme ??
    //     ColorScheme.fromSeed(
    //         seedColor: const Color(0xFFF47C7C), brightness: Brightness.dark);
    return ThemeData(
        brightness: Brightness.dark, colorSchemeSeed: Colors.green.shade400);
  }
}
