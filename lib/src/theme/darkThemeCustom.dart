import 'package:flutter/material.dart';

final myThemeDark = ThemeData.dark().copyWith(
  accentColor: Colors.red,
  colorScheme: ColorScheme(
    primary: Colors.red,
    onPrimary: Colors.black,
    primaryVariant: Colors.orange,
    background: Colors.red,
    onBackground: Colors.black,
    secondary: Colors.orange,
    onSecondary: Colors.white,
    secondaryVariant: Colors.deepOrange,
    error: Colors.black,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    brightness: Brightness.light,
  ),
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(selectedItemColor: Colors.red),
);
