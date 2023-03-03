import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 102, 3),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey),
            textStyle:
                MaterialStatePropertyAll(TextStyle(color: Colors.black  )))));
