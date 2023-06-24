import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/image_strings.dart';
import '../Not_Used_homescreen.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int _selectedIndex = 0;
  double Xoffset = 0;
  double Yoffset = 0;

  double scaleFactor = 1;
  bool isDrawerOpen = false;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(Xoffset, Yoffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                isDrawerOpen
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            Xoffset = 0;
                            Yoffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(
                            () {
                              Xoffset = 230;
                              Yoffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            },
                          );
                        },
                        icon: const Icon(Icons.menu),
                      ),
                const SizedBox(width: 80),
                Text(
                  "Hi!   Brice Joshy",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 80),
                const CircleAvatar(
                  child: Icon(Icons.person_2_rounded),
                )
              ],
            ),
          ),
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: const [
          //       Icon(Icons.search_rounded),
          //       Text("Search Your Products"),
          //     ],
          //   ),
          // )
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
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
        ],
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
