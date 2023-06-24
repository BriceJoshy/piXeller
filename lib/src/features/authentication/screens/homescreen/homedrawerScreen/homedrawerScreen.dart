import 'package:flutter/material.dart';
import 'package:mini_project_1/src/components/SIdeBarStuff/drawerScreen.dart';
import 'package:mini_project_1/src/features/authentication/screens/homescreen/homedrawerScreen/homescreenbody.dart';
import 'package:mini_project_1/src/features/authentication/screens/homescreen/homescreen.dart';

class HomeDrawerScreen extends StatefulWidget {
  const HomeDrawerScreen({super.key});

  @override
  State<HomeDrawerScreen> createState() => _HomeDrawerScreenState();
}

class _HomeDrawerScreenState extends State<HomeDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [drawerScreen(), HomePageBody()],
      ),
    );
  }
}
