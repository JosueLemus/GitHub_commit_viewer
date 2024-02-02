import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkmode = false,
  });

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: const Color(0xff24292e),
        appBarTheme: const AppBarTheme(centerTitle: false),
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkmode}) => AppTheme(
        isDarkmode: isDarkmode ?? this.isDarkmode,
      );
}
