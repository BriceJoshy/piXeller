import 'package:flutter/material.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';
import 'package:rive/rive.dart';

import '../../../../apis/api.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("hello"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


//  Center(
//         child: TextButton(
//           onPressed: () => {
//             APIs.auth.signOut().then((value) => Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (_) => AnimatedLoginForm())))
//           },
//           child: Text("Logout"),
//         ),
//       ),