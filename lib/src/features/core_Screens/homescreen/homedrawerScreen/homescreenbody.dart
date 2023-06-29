import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../apis/api.dart';
import '../../../../common_widgets/Filter_categories_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../authentication/screens/profilescreen/profileScreen.dart';
import '../../Add_item_producer_Screen/addItemListPage.dart';
import '../../splash_screen/splashscreen.dart';
import '../Not_Used_homescreen.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

CollectionReference producerUser = APIs.firestore.collection("Users");
DocumentReference reference = producerUser.doc(APIs.auth.currentUser!.uid);

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();
  }

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
    mq = MediaQuery.of(context).size;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xoffset, yoffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              children: [
                const SizedBox(width: 10),
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
                        icon: const Icon(Icons.arrow_back_ios),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            xoffset = 260;
                            yoffset = 115;
                            scaleFactor = 0.75;
                            isDrawerOpen = true;
                          });
                        },
                        icon: const Icon(Icons.menu),
                      ),
                const SizedBox(width: 80),
                StreamBuilder<DocumentSnapshot>(
                  stream: reference.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("User not found",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ));
                    }
                    if (snapshot.hasData) {
                      DocumentSnapshot docSnapshot = snapshot.data!;
                      String fieldData =
                          (docSnapshot.get('fullname')).toString();
                      return Text(
                        "Hi! $fieldData",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    return const Text("Loading...");
                  },
                ),
                const SizedBox(width: 70),
                ClipRRect(
                  borderRadius: BorderRadius.circular(mq.height * .1),
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: reference.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Icon(Icons.person_2_rounded);
                      }
                      if (snapshot.hasData) {
                        DocumentSnapshot docSnapshot = snapshot.data!;
                        String fieldData =
                            (docSnapshot.get('image')).toString();
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Profile_Screen(user: APIs.me),
                                  ));
                            },
                            child: CachedNetworkImage(
                                width: screenHeight * .055,
                                height: screenHeight * .055,
                                fit: BoxFit.cover,
                                imageUrl: fieldData));
                      }
                      return const Text("Loading...");
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: const Row(
              children: [
                Icon(Icons.search_rounded),
                SizedBox(width: 50),
                Text("Search Your Products"),
              ],
            ),
          ),
          SizedBox(
            height: 95,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                MyFilterCategoryListWidget(
                  image: Image.asset(
                    "assets/gifs/clothes.gif",
                    color: Colors.white,
                  ),
                  name: "Clothes",
                ),
                MyFilterCategoryListWidget(
                  image: Image.asset(
                    "assets/gifs/fruit.gif",
                    color: Colors.white,
                  ),
                  name: "Fruits",
                ),
                MyFilterCategoryListWidget(
                  image: Image.asset(
                    "assets/gifs/vegetable.gif",
                    color: Colors.white,
                  ),
                  name: "Vegetables",
                ),
                MyFilterCategoryListWidget(
                  image: Image.asset(
                    "assets/gifs/paintings.gif",
                    color: Colors.white,
                  ),
                  name: "Paintings",
                ),
                MyFilterCategoryListWidget(
                  image: Image.asset(
                    "assets/gifs/garden_centre.gif",
                    color: Colors.white,
                  ),
                  name: "Garden Center",
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // ListView(),
          // Spacer(),
          Container(
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
                    onTap: () {
                      _onItemTapped(1);
                      // Get.to(() => BiddingPage());
                    }),
                _buildNotchedButton(),
                MyBottomNavigationBarIcons(
                  image: Image.asset(
                    myHomePageBottomAccountIcon,
                    color: _selectedIndex == 3 ? Colors.white : Colors.grey,
                  ),
                  onTap: () {
                    _onItemTapped(3);
                    Get.to(() => Profile_Screen(user: APIs.me));
                  },
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
        ],
      ),
    );
  }

  Widget _buildNotchedButton() {
    return SizedBox(
      height: 47,
      width: 47,
      child: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => const AddItemListPage(),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}
