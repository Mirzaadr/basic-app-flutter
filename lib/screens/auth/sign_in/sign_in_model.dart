import 'package:flutter/material.dart';

enum SignInFormType { signIn, signUp, forgotPass }

class SignInModel extends ChangeNotifier {
  SignInModel({
    this.email = '',
    this.password = '',
    this.formType = SignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false,
  });

  String email;
  String password;
  SignInFormType formType;
  bool isLoading;
  bool submitted;

  Future<dynamic> submit() async {}

  @override
  String toString() {
    return 'email: $email, password: $password, formType: $formType, isLoading: $isLoading, submitted: $submitted';
  }
}
