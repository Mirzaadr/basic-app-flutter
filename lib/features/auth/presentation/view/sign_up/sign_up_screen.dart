import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_sizes.dart';
import 'package:flutter_application/core/localization/string_hardcoded.dart';
import 'package:flutter_application/core/widgets/custom_button.dart';
import 'package:flutter_application/core/widgets/custom_text_field.dart';
import 'package:flutter_application/features/auth/domain/user.dart';
import 'package:flutter_application/features/auth/presentation/view/sign_up/sign_up_controller.dart';
import 'package:flutter_application/routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController emailController =TextEditingController();
  TextEditingController usernameController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  // final _formKey = GlobalKey<FormState>();
	IconData iconPassword = CupertinoIcons.eye_fill;
	bool obscurePassword = true;
	bool signUpRequired = false;

	bool containsUpperCase = false;
	bool containsLowerCase = false;
	bool containsNumber = false;
	bool containsSpecialChar = false;
	bool contains8Length = false;

  void _signup() {}

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(signUpControllerProvider)
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

                  // username
                  gapH12,
                  CustomTextField(
                    hintText: 'Username',
                    controller: usernameController,
                  ),
                  
                  // password
                  gapH12,
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
                      text: "Sign Up".hardcoded,
                      onPressed: () {
                        MyUser myUser = MyUser.empty;
                        myUser = myUser.copyWith(
                          email: emailController.text.trim(),
                          name: usernameController.text.trim(),
                        );
                        ref.read(signUpControllerProvider.notifier).signUp(myUser, passwordController.text.trim());
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