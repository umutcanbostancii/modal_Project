import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/user_model.dart';

import 'package:http/http.dart' as http;

class ProfileViewModel extends ChangeNotifier {
  User? user;
  List<User> users = [];
  final String _baseUrl = "https://reqres.in/api/users/";

  Future getUser(int id) async {
    http.Response response = await http.get(Uri.parse("$_baseUrl$id"));

    var map = jsonDecode(response.body);
    user = User.fromJson(map["data"]);
    notifyListeners();
  }

  Future getUSers() async {
    http.Response response = await http.get(Uri.parse(_baseUrl));
    var map = json.decode(response.body);
    print(map);
    for (var item in map["data"]) {
      users.add(User.fromJson(item));
    }

    notifyListeners();
  }
}
