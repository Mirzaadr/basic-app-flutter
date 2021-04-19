import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/routes/main_route.dart';
import 'package:starter_app/screens/dashboard/dashboard_page.dart';
import 'package:starter_app/services/api_services.dart';

import 'screens/auth/sign_in/sign_in_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FutureBuilder(
        future: ApiServices().reloadToken(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data) {
            return Dashboard(title: 'Home');
          }
          return SignIn(
            title: 'Masuk',
          );
        },
      ),
      onGenerateRoute: (settings) => MainRouter.generateRoute(settings),
    );
  }
}
