import 'package:flutter/material.dart';
import 'package:modal_project/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? get user => context.watch()<ProfileViewModel>().user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          "Json Data",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                    context.read<ProfileViewModel>().user!.avatar!)),
            Text(
              context.watch<ProfileViewModel>().user!.firstName!,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              context.watch<ProfileViewModel>().user!.lastName!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue[700]),
            ),
            Text(
              context.watch<ProfileViewModel>().user!.email!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
