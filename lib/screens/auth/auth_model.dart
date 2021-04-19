import 'package:flutter/material.dart';

enum AuthStatus { notLoggedIn, notRegistered, loggedIn, registered, loading }

class AuthProvider extends ChangeNotifier {
  AuthStatus _loggedInStatus = AuthStatus.notLoggedIn;
  AuthStatus _registeredInStatus = AuthStatus.notRegistered;

  AuthStatus get loggedInStatus => _loggedInStatus;
  AuthStatus get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'Username': email,
      'Password': password
    };

    return result;
  }
}
