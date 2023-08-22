import 'package:flutter/material.dart';

class ThemeApp {
  static final themeLight = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: Colors.red,
        background: Colors.white,
        primary: Colors.redAccent,
        primaryContainer: Colors.grey[100],
        secondary: Colors.grey,
        secondaryContainer: Colors.grey[300],
      ));
  static final themeDark = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.red,
          background: Colors.black,
          primary: Colors.redAccent,
          primaryContainer: Colors.grey[900],
          secondary: Colors.grey,
          secondaryContainer: Colors.grey[700]));
}
