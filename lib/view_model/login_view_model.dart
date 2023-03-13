import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LoginViewModel extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  Future login() async {
    var body = {
      "email": usernameController.text,
      "password": passwordController.text,
    };
    print(body);

    http.Response response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
    }
  }
}
