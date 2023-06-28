import 'package:flutter/material.dart';
import 'package:mini_project_1/src/components/SIdeBarStuff/drawerScreen.dart';

import 'homescreenbody.dart';

class HomeDrawerScreen extends StatefulWidget {
  const HomeDrawerScreen({super.key});

  @override
  State<HomeDrawerScreen> createState() => _HomeDrawerScreenState();
}

class _HomeDrawerScreenState extends State<HomeDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [DrawerScreen(), const HomePageBody()],
      ),
    );
  }
}
