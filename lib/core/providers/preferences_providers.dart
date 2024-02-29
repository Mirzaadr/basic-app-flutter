import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_providers.g.dart';

class Preferences {
  late final SharedPreferences _instance;

  SharedPreferences get instance => _instance;

  Future<void> loadInstance() async {
    _instance = await SharedPreferences.getInstance();
  }
}

@Riverpod(keepAlive: true)
Preferences preferences(PreferencesRef ref) {
  return Preferences();
}

