import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
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
              LottieBuilder.network(
                  "https://assets1.lottiefiles.com/packages/lf20_ktwnwv5m.json"),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(159, 214, 217, 246)),
                child: TextField(
                  controller:
                      context.watch<LoginViewModel>().usernameController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(159, 214, 217, 246)),
                child: TextField(
                    controller:
                        context.watch<LoginViewModel>().passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<LoginViewModel>().login();
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
