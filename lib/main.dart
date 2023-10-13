import 'package:flutter/material.dart';
import 'package:gdsc_ui_design/Screens/OmUI/main_screen.dart';
import 'package:gdsc_ui_design/Screens/OmUI/schedule_info.dart';
import 'package:gdsc_ui_design/Screens/splace_screen.dart';

void main() {
  final colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    background: Color.fromARGB(255, 16, 30, 43),
    seedColor: Color.fromARGB(255, 16, 30, 43),
  );

  final theme = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: colorScheme,
  );

  runApp(MaterialApp(
    theme: theme,
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}
