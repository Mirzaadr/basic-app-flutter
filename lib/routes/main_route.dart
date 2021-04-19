import 'package:flutter/material.dart';
import 'package:starter_app/screens/auth/sign_in/sign_in_page.dart';
import 'package:starter_app/screens/auth/sign_up/sign_up_page.dart';
import 'package:starter_app/screens/dashboard/dashboard_page.dart';
import 'package:starter_app/screens/home/home_page.dart';

class AppRoutes {
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const home = '/home';
}

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MyHomePage(
                  title: 'Home',
                ));
      case AppRoutes.signIn:
        return MaterialPageRoute(builder: (_) => SignIn());
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => SignUp());
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => Dashboard(
                  title: 'Home',
                ));
      default:
        return _errorRoute(message: 'No route found');
    }
  }

  static Route<dynamic> _errorRoute({String message = "Error"}) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text(message),
        ),
      );
    });
  }
}
