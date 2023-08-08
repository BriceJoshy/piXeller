import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../constants/image_strings.dart';
import '../DistributerScreen/DistrubuterCartPage.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _selectedIndex = 0;

  bool isBottomNavBarVisible = true;

  void toggleBottomNavBarVisibility() {
    setState(() {
      isBottomNavBarVisible = !isBottomNavBarVisible;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late SMIBool isMenuOpen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: const HomePageBody(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      extendBody: true,
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
                  myHomePageBottomBidIcon,
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
        child: const Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}
