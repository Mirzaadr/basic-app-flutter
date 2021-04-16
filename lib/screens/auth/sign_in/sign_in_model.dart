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

  Future<dynamic> submit() async {
    updateWith(isLoading: true);
    try {
      print('email: $email, pass: $password');
    } catch (e) {
      print(e);
    } finally {
      updateWith(isLoading: false);
    }
  }

  void updateWith({
    String? email,
    String? password,
    SignInFormType? formType,
    bool? isLoading,
    bool? submitted,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.formType = formType ?? this.formType;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;
    notifyListeners();
  }

  @override
  String toString() {
    return 'email: $email, password: $password, formType: $formType, isLoading: $isLoading, submitted: $submitted';
  }
}
