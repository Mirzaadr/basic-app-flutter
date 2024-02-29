import 'package:flutter/material.dart';
import 'package:flutter_application/core/providers/preferences_providers.dart';
import 'package:flutter_application/features/settings/data/settings_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsNotifier with ChangeNotifier {
  SettingsNotifier(this._settingsService);

  final SettingsService _settingsService;

  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new ThemeMode in memory
    _themeMode = newThemeMode;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateThemeMode(newThemeMode);
  }
}

final themeController = ChangeNotifierProvider<SettingsNotifier>((ref) {
  final prefs = ref.watch(preferencesProvider).instance;
  final settings = SettingsNotifier(SettingsService(prefs: prefs));

  return settings;
});
