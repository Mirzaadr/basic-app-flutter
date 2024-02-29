import 'package:flutter/material.dart';
import 'package:flutter_application/core/theme/theme.dart';
import 'package:flutter_application/features/settings/domain/settings_controller.dart';
import 'package:flutter_application/routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final theme = ref.watch(themeController).themeMode;
    return  MaterialApp.router(
      title: 'Simple App',
      routerConfig: appRouter,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}