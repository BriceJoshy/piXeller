import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'InfoCard.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 288,
          height: double.infinity,
          color: const Color(0xff17203a),
          child: const SafeArea(
            child: Column(
              children: [
                InfoCard(
                  name: 'Brice Joshy',
                  profession: 'Producer',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
