
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_sizes.dart';
import 'package:flutter_application/core/widgets/custom_button.dart';
import 'package:flutter_application/features/onboarding/presentation/onboarding_controller.dart';
import 'package:flutter_application/routes/app_router.dart';
import 'package:flutter_application/routes/scaffold_with_nested_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 450,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Track your time.\nBecause time counts.',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                gapH16,
                SvgPicture.asset(
                  'assets/time-tracking.svg',
                  width: 200,
                  height: 200,
                  semanticsLabel: 'Time tracking logo',
                ),
                gapH16,
                CustomButton(
                  text: 'Get Started'.hardcoded,
                  isLoading: state.isLoading,
                  onPressed: state.isLoading
                      ? null
                      : () async {
                          await ref
                              .read(onboardingControllerProvider.notifier)
                              .completeOnboarding();
                          if (context.mounted) {
                            // go to sign in page after completing onboarding
                            context.goNamed(AppRoute.signIn.name);
                          }
                        },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}