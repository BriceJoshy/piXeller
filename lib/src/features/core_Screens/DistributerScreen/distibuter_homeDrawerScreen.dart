import 'package:flutter/material.dart';
import 'package:mini_project_1/src/components/SIdeBarStuff/drawerScreen.dart';
import 'package:mini_project_1/src/features/core_Screens/DistributerScreen/Distributer_HOmeBody.dart';
import 'package:mini_project_1/src/features/core_Screens/DistributerScreen/DistributerdrawerScreen.dart';

class DistributerHome_DrawerPage extends StatefulWidget {
  const DistributerHome_DrawerPage({super.key});

  @override
  State<DistributerHome_DrawerPage> createState() =>
      _DistributerHome_DrawerPageState();
}

class _DistributerHome_DrawerPageState
    extends State<DistributerHome_DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [DistributerDrawerScreen(), const DistributerHomePage()],
      ),
    );
  }
}
