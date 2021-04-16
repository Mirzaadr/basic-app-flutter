import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          TextButton(onPressed: () {}, child: Text('Sign Up')),
          // IconButton(icon: Icon(Icons.ac_unit), onPressed: () => {})
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscure,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(_obscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 10),
      //   child: Column(children: [
      //     TextField(
      //       controller: _usernameController,
      //       decoration: InputDecoration(labelText: "Email"),
      //     ),
      //     TextField(
      //       controller: _passwordController,
      //       obscureText: _obscure,
      //       decoration: InputDecoration(
      //         labelText: "Password",
      //         suffixIcon: Padding(
      //           padding: EdgeInsets.only(top: 15.0),
      //           child: InkWell(
      //             onTap: _togglePasswordView,
      //             child: Icon(_obscure
      //                 ? Icons.visibility_outlined
      //                 : Icons.visibility_off_outlined),
      //           ),
      //         ),
      //       ),
      //     ),
      //     SizedBox.expand(
      //       child: ElevatedButton(
      //         onPressed: () async {
      //           var username = _usernameController.text;
      //           var password = _passwordController.text;
      //           print(username + password);
      //         },
      //         child: Text("Sign In"),
      //         style: ButtonStyle(),
      //       ),
      //     ),
      //   ]),
      // )
    );
  }
}
