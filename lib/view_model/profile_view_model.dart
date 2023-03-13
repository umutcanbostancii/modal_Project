import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/user_model.dart';

import 'package:http/http.dart' as http;

class ProfileViewModel extends ChangeNotifier {
  User? user;
  List<User> users = [];
  final String _baseUrl = "https://reqres.in/api/users";
  int perPage = 6;
  int page = 1;
  int totalPage = 1;

  Future getUser(int id) async {
    http.Response response = await http.get(Uri.parse("$_baseUrl/$id"));

    var map = jsonDecode(response.body);
    user = User.fromJson(map["data"]);
    notifyListeners();
  }

  Future getUSers() async {
    http.Response response =
        await http.get(Uri.parse(_baseUrl + "?page=$page&per_page=$perPage"));
    var map = json.decode(response.body);
    users.clear();
    totalPage = map["total_pages"];
    print(map);
    for (var item in map["data"]) {
      users.add(User.fromJson(item));
    }

    notifyListeners();
  }

  Future SetPage(int p) async {
    page = p;
    await getUSers();
  }
}
