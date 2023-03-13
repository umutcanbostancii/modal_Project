import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:modal_project/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: context.watch<LoginViewModel>().usernameController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: context.watch<LoginViewModel>().passwordController,
                decoration: InputDecoration(labelText: "Password"),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<LoginViewModel>().login();
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
