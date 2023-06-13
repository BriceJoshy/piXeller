import 'package:flutter/material.dart';
import 'package:mini_project_1/src/features/authentication/screens/login_page/animated_login_page.dart';
import 'package:mini_project_1/src/features/authentication/screens/login_page/login_page.dart';

import '../../../../apis/api.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => {
            APIs.auth.signOut().then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => AnimatedLoginForm())))
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
