import 'package:flutter/material.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';

class tabbar_material_widget extends StatefulWidget {
  const tabbar_material_widget({super.key});

  @override
  State<tabbar_material_widget> createState() => _tabbar_material_widgetState();
}

class _tabbar_material_widgetState extends State<tabbar_material_widget> {
  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
        opacity: 0,
        child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BottomAppBar(
        padding: EdgeInsets.all(10),
        color: Color(0xff4a5369).withOpacity(0.9),
        notchMargin: 8,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(
              index: 0,
              icon: Image.asset(
                myHomePageBottomHomeIcon,
                color: Colors.white,
              ),
            ),
            buildTabItem(
              index: 1,
              icon: Image.asset(
                myHomePageBottomHistoryIcon,
                color: Colors.white,
              ),
            ),
            placeholder,
            buildTabItem(
              index: 2,
              icon: Image.asset(
                myHomePageBottomAccountIcon,
                color: Colors.white,
              ),
            ),
            buildTabItem(
              index: 3,
              icon: Image.asset(
                myHomePageBottomSettingsIcon,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabItem({required int index, required Image icon}) {
    return IconButton(onPressed: () {}, icon: icon);
  }
}