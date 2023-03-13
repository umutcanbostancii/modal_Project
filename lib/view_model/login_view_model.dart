import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  Future login() async {
    var body = {
      "email": usernameController.text,
      "password": passwordController.text,
    };
    print(body);
  }
}
