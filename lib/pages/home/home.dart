import 'package:flutter/material.dart';
import 'package:modal_project/pages/profile/profile_page.dart';
import 'package:modal_project/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProfileViewModel>().getUSers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: context.watch<ProfileViewModel>().users.length,
              itemBuilder: (context, index) {
                User _user = context.watch<ProfileViewModel>().users[index];
                return GestureDetector(
                  onTap: () async {
                    await context.read<ProfileViewModel>().getUser(_user.id!);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.teal),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network("${_user.avatar}"),
                            ),
                            Column(
                              children: [
                                Text(
                                  "${_user.firstName!} ${_user.lastName!}",
                                ),
                                Text(
                                  _user.email!,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
            Container(
              decoration: BoxDecoration(color: Colors.teal[100]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1;
                      i <= context.watch<ProfileViewModel>().totalPage;
                      i++)
                    context.watch<ProfileViewModel>().page == i
                        ? Text(i.toString())
                        : TextButton(
                            onPressed: () {
                              context.read<ProfileViewModel>().SetPage(i);
                            },
                            child: Text(
                              i.toString(),
                            ),
                          ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
