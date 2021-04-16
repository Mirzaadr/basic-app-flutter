import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Sign Up"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          TextField(
            controller: fullnameController,
            decoration: InputDecoration(labelText: "Full Name"),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: "Password"),
          ),
          TextButton(onPressed: () => {}, child: Text('Sign Up'))
        ]),
      ),
    );
  }
}
