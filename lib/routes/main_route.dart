import 'package:flutter/material.dart';
import 'package:starter_app/models/talent_model.dart';
import 'package:starter_app/screens/auth/sign_in/sign_in_page.dart';
import 'package:starter_app/screens/auth/sign_up/sign_up_page.dart';
import 'package:starter_app/screens/dashboard/dashboard_page.dart';
import 'package:starter_app/screens/detail/talent_detail.dart';
import 'package:starter_app/screens/home/home_page.dart';

class AppRoutes {
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const home = '/home';
  static const detail = '/detail';
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
      case AppRoutes.detail:
        final Talent args = settings.arguments as Talent;
        return MaterialPageRoute(
            builder: (_) => TalentDetail(
                  data: args,
                  index: 1,
                ),
            settings: settings);
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
