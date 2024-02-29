import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/app_startup.dart';
// import 'package:flutter_application/features/settings/domain/settings_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'firebase_options.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // final container = ProviderContainer();
  // await container.read(themeController).loadSettings();
  
  runApp(ProviderScope(child: AppStartupWidget(onLoaded:(context) => const MainApp(),)));
}
