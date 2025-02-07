import 'package:flutter/material.dart';
import 'AppTheme.dart';

enum ThemeModeEnum { light, dark, system }

class ThemeManager extends ChangeNotifier {
  ThemeModeEnum _themeMode = ThemeModeEnum.system;

  ThemeModeEnum get themeMode => _themeMode;

  void setThemeMode(ThemeModeEnum themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  ThemeData get currentTheme {
    switch (_themeMode) {
      case ThemeModeEnum.dark:
        return AppTheme.darkTheme;
      case ThemeModeEnum.light:
        return AppTheme.lightTheme;
      case ThemeModeEnum.system:
        return WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
            ? AppTheme.darkTheme
            : AppTheme.lightTheme;
    }
  }
}
