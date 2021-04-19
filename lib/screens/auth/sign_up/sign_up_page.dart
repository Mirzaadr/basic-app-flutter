import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget _fullnameInput() {
    return TextFormField(
      controller: fullnameController,
      decoration: InputDecoration(),
    );
  }

  Widget _emailInput() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(),
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(),
    );
  }

  Widget _buildContent() {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 8.0),
        _fullnameInput(),
        const SizedBox(height: 8.0),
        _emailInput(),
        const SizedBox(height: 8.0),
        _passwordInput(),
        const SizedBox(height: 8.0),
        ElevatedButton(onPressed: () => {}, child: Text('Register'))
      ],
    ));
  }

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
        child: _buildContent(),
      ),
    );
  }
}
