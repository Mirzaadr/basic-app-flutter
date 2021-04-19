import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/models/user_model.dart';
import 'package:starter_app/routes/main_route.dart';
import 'package:starter_app/services/api_services.dart';

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

  void submit(BuildContext context) async {
    updateWith(isLoading: true);
    try {
      print('email: $email, pass: $password');
      Response response = await ApiServices().dio.request(
            '/api/token',
            data: {'Username': email, 'Password': password},
            options: Options(method: 'POST'),
          );
      User userData = User.fromJson(response.data);
      var authToken = userData.token;
      ApiServices().setClientToken('$authToken');
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
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
