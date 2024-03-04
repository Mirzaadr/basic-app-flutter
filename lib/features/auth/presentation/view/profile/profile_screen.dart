import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_sizes.dart';
import 'package:flutter_application/features/auth/presentation/view/profile/profile_controller.dart';
import 'package:flutter_application/features/settings/domain/settings_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileController = ref.watch(profileControllerProvider);
    final currentUser = ref.watch(profileControllerProvider.notifier).currentUser;
    final isLoading = profileController
      .maybeWhen(
        loading: () => true, 
        orElse: () => false
      );
    final themeSettings = ref.watch(themeController);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        // actions: [],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                16.0
              ),
              child: Column(
                children: [
                  const Align(
                    child: CircleAvatar(
                      radius: 52.0,
                    )
                  ),
                  gapH20,
                  Text(
                    currentUser?.displayName ?? "User 1"
                  ),
                  gapH12,
                  Text(
                    currentUser!.email ?? "Email"
                  ),
                ],
              ),
            ),
            gapH20,
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    DropdownButton<ThemeMode>(
                      // Read the selected themeMode from the controller
                      value: themeSettings.themeMode,
                      // Call the updateThemeMode method any time the user selects a theme.
                      onChanged: themeSettings.updateThemeMode,
                      items: const [
                        DropdownMenuItem(
                          value: ThemeMode.system,
                          child: Text('System Theme'),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.light,
                          child: Text('Light Theme'),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.dark,
                          child: Text('Dark Theme'),
                        )
                      ],
                    ),
                  ],
                ),
              )),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : () {
                    ref.read(profileControllerProvider.notifier).signOut();
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade700
                  ),
                  child: isLoading ?
                    SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Theme.of(context).colorScheme.inversePrimary,)) :
                    const Text(
                      "Sign Out",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}