import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const keyThemeMode = 'theme_mode'; 
  final SharedPreferences prefs;

  SettingsService({required this.prefs});
  
  // Future<ThemeMode> themeMode() async => ThemeMode.system;
  Future<ThemeMode> themeMode() async {
    int intMode = prefs.getInt(keyThemeMode) ?? 0;

    return ThemeMode.values[intMode];
  }

  Future<int> getThemeMode() async => prefs.getInt(keyThemeMode) ?? ThemeMode.system.index;

  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    final value = theme.index;
    await prefs.setInt(keyThemeMode, value);
  }
}