import 'package:alison_task/core/functions/navigation.dart';
import 'package:alison_task/data/local/shared_prefrence.dart';
import 'package:alison_task/view/login_page.dart';
import 'package:flutter/material.dart';

class StaticPages extends StatelessWidget {
  const StaticPages({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (title == "Account")
            TextButton(
                onPressed: () async {
                  await LocalSharedPrefrence.instance.deleteToken();
                  navigateMeReplace(
                      context: context, screen: const LoginPage());
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(color: Colors.red),
                ))
        ],
      ),
    );
  }
}
