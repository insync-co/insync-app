import 'package:flutter/material.dart';
import 'package:insync_flutter/core/util/theme/colors.dart';

class AppTheme {

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: Colors.white,
        secondary: softBlack,
        onSecondary: Colors.white,
        tertiary: link,
        error: error,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: softBlack,
        outline: softWhite
    )
  );


  static final darkTheme = ThemeData(
    brightness: Brightness.dark
  );
}