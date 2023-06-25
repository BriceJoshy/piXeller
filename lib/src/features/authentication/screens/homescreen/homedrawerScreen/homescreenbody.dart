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
  double xoffset = 0;
  double yoffset = 0;

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
      transform: Matrix4.translationValues(xoffset, yoffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 45,
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
                            xoffset = 0;
                            yoffset = 0;
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
                              xoffset = 260;
                              yoffset = 115;
                              scaleFactor = 0.75;
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
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: const Row(
                children: [
                  Icon(Icons.search_rounded),
                  SizedBox(
                    width: 50,
                  ),
                  Text("Search Your Products"),
                ],
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: SizedBox(
              height: 95,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: SizedBox(
                      height: 95,
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff3a4054),
                            ),
                            // child: Image.asset("name"),
                          ),
                          Text(
                            "Vegetables",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
