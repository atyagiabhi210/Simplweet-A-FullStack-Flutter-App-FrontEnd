import 'package:flutter/material.dart';
class ThemeManager extends ChangeNotifier{

  ThemeMode _themeMode= ThemeMode.system;
  get themeMode=> _themeMode;

  toggleTheme(bool isDark){
    _themeMode= isDark? ThemeMode.dark: ThemeMode.light;
    notifyListeners();
  }

}