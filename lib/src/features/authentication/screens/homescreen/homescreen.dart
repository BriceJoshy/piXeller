import 'package:flutter/material.dart';
import 'package:mini_project_1/src/features/authentication/screens/sideBarScreen/next_page.dart';

import '../../../../constants/image_strings.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          const NextPage(),
          // homescreen page stuff
          MySideBarButton(
            press: () {},
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: const BoxDecoration(
            color: Color(0xff3a4054),
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyBottomNavigationBarIcons(
                image: Image.asset(
                  myHomePageBottomHomeIcon,
                  color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                ),
                onTap: () => _onItemTapped(0),
              ),
              MyBottomNavigationBarIcons(
                image: Image.asset(
                  myHomePageBottomHistoryIcon,
                  color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                ),
                onTap: () => _onItemTapped(1),
              ),
              _buildNotchedButton(),
              MyBottomNavigationBarIcons(
                image: Image.asset(
                  myHomePageBottomAccountIcon,
                  color: _selectedIndex == 3 ? Colors.white : Colors.grey,
                ),
                onTap: () => _onItemTapped(3),
              ),
              MyBottomNavigationBarIcons(
                image: Image.asset(
                  myHomePageBottomSettingsIcon,
                  color: _selectedIndex == 4 ? Colors.white : Colors.grey,
                ),
                onTap: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotchedButton() {
    return SizedBox(
      height: 47,
      width: 47,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class MySideBarButton extends StatelessWidget {
  const MySideBarButton({
    super.key,
    required this.press,
  });
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(left: 20, top: 30),
          padding: const EdgeInsetsDirectional.all(10),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: Image.asset(
            myHomePageBottomSideBarIcon,
            height: 32,
            width: 32,
          ),
        ),
      ),
    );
  }
}

class MyBottomNavigationBarIcons extends StatelessWidget {
  final Image image;
  final VoidCallback onTap;

  const MyBottomNavigationBarIcons({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: GestureDetector(
        onTap: onTap,
        child: image,
      ),
    );
  }
}
