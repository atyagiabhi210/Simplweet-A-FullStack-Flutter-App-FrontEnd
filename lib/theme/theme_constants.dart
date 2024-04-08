import 'package:flutter/material.dart';

ThemeData lightTheme= ThemeData(
  primaryColor: Colors.yellow,
  
  brightness: Brightness.light,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.yellow,
    focusColor: Colors.yellow,
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(1),

    ),
  ),
);

ThemeData darkTheme= ThemeData(
  brightness: Brightness.dark,
);