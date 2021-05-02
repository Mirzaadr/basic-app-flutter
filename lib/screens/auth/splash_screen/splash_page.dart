import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/routes/main_route.dart';
import 'package:starter_app/screens/auth/sign_in/sign_in_page.dart';
import 'package:starter_app/services/api_services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> _getuser() async {
    try {
      await ApiServices().reloadToken();
      Response response = await ApiServices().dio.request(
            '/api/token',
            options: Options(method: 'GET'),
          );
      // User userData = User.fromJson(response.data);
      // var authToken = userData.token;
      // ApiServices().setClientToken('$authToken');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getuser(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.data) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
        }
        return SignIn(
          title: 'Masuk',
        );
      },
    );
  }
}
