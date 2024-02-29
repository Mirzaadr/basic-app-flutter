import 'package:flutter/material.dart';
import 'package:flutter_application/routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          "Home Screen"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // context.pushNamed(AppRoute.profile.name);
                context.goNamed(AppRoute.profile.name);
              }, 
              child: const Text(
                "go to profile"
              )
            )
          ],
        ),
        
      ),
    );
  }
}