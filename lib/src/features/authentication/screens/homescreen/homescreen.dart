import 'package:flutter/material.dart';
import 'package:mini_project_1/src/common_widgets/grid_container.dart';
import 'package:mini_project_1/src/common_widgets/tabbar_material_widget.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';
import 'package:mini_project_1/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:rive/rive.dart';

import '../../../../apis/api.dart';
import '../login_page/animated_login_page.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const tabbar_material_widget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            APIs.auth.signOut().then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => onBoardingScreen())));
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: EdgeInsets.all(10),
          children: [
            grid_container(
              name: "Tomato",
              color: Colors.grey,
              image: Image.asset("assets/icons/role.png"),
            ),
            grid_container(
              name: "Tomato",
              color: Colors.grey,
              image: Image.asset("assets/icons/role.png"),
            ),
            grid_container(
              name: "Tomato",
              color: Colors.grey,
              image: Image.asset("assets/icons/role.png"),
            ),
            grid_container(
              name: "Tomato",
              color: Colors.grey,
              image: Image.asset("assets/icons/role.png"),
            )
          ],
        ),
      ),
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