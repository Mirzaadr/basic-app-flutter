import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_sizes.dart';
import 'package:flutter_application/core/localization/string_hardcoded.dart';
import 'package:flutter_application/core/widgets/custom_button.dart';
import 'package:flutter_application/core/widgets/custom_text_field.dart';
import 'package:flutter_application/features/auth/presentation/view/sign_in/sign_in_controller.dart';
import 'package:flutter_application/routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  // String? _errorMsg;

  void login() {}

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(signInControllerProvider)
      .maybeWhen(
        loading: () => true, 
        orElse: () => false
      );
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
                  gapH12,
                  
                  // password
                  CustomTextField(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),
              
                  // forgot password
                  gapH12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.goNamed(AppRoute.forgotPassword.name);
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                    
                  // sign inbutton
                  gapH24,
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Login".hardcoded,
                      onPressed: () {
                        ref.read(signInControllerProvider.notifier).signIn(
                          emailController.text.trim(), 
                          passwordController.text.trim()
                        );
                      },
                      isLoading: isLoading,
                    ),
                  ),
                    
                  // donst have account
                  gapH24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.goNamed('signUp'),
                        child: const Text(
                          "Register Here",
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