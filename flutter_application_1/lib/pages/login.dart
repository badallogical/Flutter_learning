import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login Page")),
        body: ElevatedButton(
          child: const Text("Go Back"),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
