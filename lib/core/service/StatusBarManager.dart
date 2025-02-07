import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarManager {

  static bool _isHidden = false;

  static bool get isHidden => _isHidden;

  // Hide the status bar
  static void hideStatusBar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _isHidden = true;
  }

  // Show the status bar
  static void showStatusBar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _isHidden = false;
  }

  static void transparentStatusBar() {
    // Show the status bar first
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Fully transparent status bar
        statusBarIconBrightness: Brightness.dark, // Dark icons for light background
        systemNavigationBarColor: Colors.black, // Customize nav bar color if needed
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    _isHidden = false;
  }
}
