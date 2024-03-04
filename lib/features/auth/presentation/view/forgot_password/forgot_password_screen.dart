import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_sizes.dart';
import 'package:flutter_application/core/localization/string_hardcoded.dart';
import 'package:flutter_application/core/widgets/custom_button.dart';
import 'package:flutter_application/core/widgets/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  gapH12,
              
                  // app name
                  const Text(
                    "M I N I M A L",
                    style: TextStyle(fontSize: 20),
                  ),
              
                  // email
                  gapH24,
                  CustomTextField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                    
                  // send email button
                  gapH24,
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Send Email".hardcoded,
                      onPressed: () {},
                    ),
                  ),
                    
                  // donst have account
                  gapH24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.goNamed('signIn'),
                        child: const Text(
                          "Login Here",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}