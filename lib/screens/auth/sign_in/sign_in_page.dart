import 'dart:math';

import 'package:flutter/material.dart';
import 'package:starter_app/screens/auth/sign_in/sign_in_model.dart';
import 'package:starter_app/screens/auth/sign_in/sign_in_strings.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, this.title = 'Sign In'}) : super(key: key);
  final String title;
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscure = true;

  SignInModel model = new SignInModel();

  @override
  void initState() {
    super.initState();
    // Temporary workaround to update state until a replacement for ChangeNotifierProvider is found
    model.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // model.dispose();
    // _node.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  void _togglePasswordView() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  void _submit() {
    print(model.toString());
  }

  Widget _buildUsernameField() {
    return TextFormField(
      key: const Key('username'),
      controller: _usernameController,
      decoration: InputDecoration(
        labelText: SignInStrings.emailLabel,
        hintText: SignInStrings.emailHint,
        // errorText: 'Email',
        // enabled: !model.isLoading,
      ),
      autocorrect: false,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      keyboardAppearance: Brightness.light,
      // onEditingComplete: _emailEditingComplete,
      // inputFormatters: <TextInputFormatter>[
      //   model.emailInputFormatter,
      // ],
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      key: const Key('password'),
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: SignInStrings.password,
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: InkWell(
            onTap: _togglePasswordView,
            child: Icon(_obscure
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined),
          ),
        ),
        // errorText: 'pass',
        // enabled: !model.isLoading,
      ),
      obscureText: _obscure,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      keyboardAppearance: Brightness.light,
      // onEditingComplete: _passwordEditingComplete,
    );
  }

  Widget _buildContent() {
    return Form(
      onChanged: () => model.updateWith(
          email: _usernameController.text, password: _passwordController.text),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 8.0),
          _buildUsernameField(),
          ...<Widget>[
            const SizedBox(height: 8.0),
            _buildPasswordField(),
          ],
          const SizedBox(height: 16.0),
          ElevatedButton(onPressed: () => _submit(), child: Text('Submit')),
          // FormSubmitButton(
          //   key: const Key('primary-button'),
          //   text: model.primaryButtonText,
          //   loading: model.isLoading,
          //   onPressed: model.isLoading ? null : _submit,
          // ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // backgroundColor: Colors.transparent,
        elevation: 0.0,
        // actions: <Widget>[
        //   TextButton(onPressed: () {}, child: Text('Sign Up')),
        //   // IconButton(icon: Icon(Icons.ac_unit), onPressed: () => {})
        // ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: min(constraints.maxWidth, 600),
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildContent(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      // body: Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Card(
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
      //         child: Column(
      //           children: [
      //             _buildUsernameField(),
      //             _buildPasswordField(),
      //             TextField(
      //               controller: _passwordController,
      //               obscureText: _obscure,
      //               decoration: InputDecoration(
      //                 labelText: "Password",
      //                 suffixIcon: Padding(
      //                   padding: EdgeInsets.only(top: 15.0),
      //                   child: InkWell(
      //                     onTap: _togglePasswordView,
      //                     child: Icon(_obscure
      //                         ? Icons.visibility_outlined
      //                         : Icons.visibility_off_outlined),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
