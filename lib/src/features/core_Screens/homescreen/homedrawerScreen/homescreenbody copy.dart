// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mini_project_1/src/common_widgets/Filter_categories_widget.dart';
// import 'package:mini_project_1/src/components/Add-Items/Page_for_add_items.producer.dart';

// import '../../../../constants/image_strings.dart';
// import '../../../authentication/screens/profilescreen/profileScreen.dart';
// import '../Not_Used_homescreen.dart';

// class HomePageBody extends StatefulWidget {
//   const HomePageBody({super.key});

//   @override
//   State<HomePageBody> createState() => _HomePageBodyState();
// }

// class _HomePageBodyState extends State<HomePageBody> {
//   int _selectedIndex = 0;
//   double xoffset = 0;
//   double yoffset = 0;

//   double scaleFactor = 1;
//   bool isDrawerOpen = false;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       transform: Matrix4.translationValues(xoffset, yoffset, 0)
//         ..scale(scaleFactor),
//       duration: const Duration(milliseconds: 250),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 40),
//             child: Row(
//               children: [
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 isDrawerOpen
//                     ? IconButton(
//                         onPressed: () {
//                           setState(() {
//                             xoffset = 0;
//                             yoffset = 0;
//                             scaleFactor = 1;
//                             isDrawerOpen = false;
//                           });
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back_ios,
//                         ),
//                       )
//                     : IconButton(
//                         onPressed: () {
//                           setState(
//                             () {
//                               xoffset = 260;
//                               yoffset = 115;
//                               scaleFactor = 0.75;
//                               isDrawerOpen = true;
//                             },
//                           );
//                         },
//                         icon: const Icon(Icons.menu),
//                       ),
//                 const SizedBox(width: 80),
//                 Text(
//                   "Hi!   Brice Joshy",
//                   style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(width: 80),
//                 const CircleAvatar(
//                   child: Icon(Icons.person_2_rounded),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(20)),
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//             child: const Row(
//               children: [
//                 Icon(Icons.search_rounded),
//                 SizedBox(
//                   width: 50,
//                 ),
//                 Text("Search Your Products"),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 95,
//             // width: double.infinity,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               shrinkWrap: true,
//               children: [
//                 MyFilterCategoryListWidget(
//                   image: Image.asset(
//                     "assets/gifs/clothes.gif",
//                     color: Colors.white,
//                   ),
//                   name: "Clothes",
//                 ),
//                 MyFilterCategoryListWidget(
//                   image: Image.asset(
//                     "assets/gifs/fruit.gif",
//                     color: Colors.white,
//                   ),
//                   name: "Fruits",
//                 ),
//                 MyFilterCategoryListWidget(
//                   image: Image.asset(
//                     "assets/gifs/vegetable.gif",
//                     color: Colors.white,
//                   ),
//                   name: "Vegetables",
//                 ),
//                 MyFilterCategoryListWidget(
//                   image: Image.asset(
//                     "assets/gifs/paintings.gif",
//                     color: Colors.white,
//                   ),
//                   name: "Paintings",
//                 ),
//                 MyFilterCategoryListWidget(
//                   image: Image.asset(
//                     "assets/gifs/garden_centre.gif",
//                     color: Colors.white,
//                   ),
//                   name: "Garden Center",
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 420,
//             // child: ADDITEM(),
//           ),
//           Container(
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//             decoration: const BoxDecoration(
//               color: Color(0xff3a4054),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(24),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 MyBottomNavigationBarIcons(
//                   image: Image.asset(
//                     myHomePageBottomHomeIcon,
//                     color: _selectedIndex == 0 ? Colors.white : Colors.grey,
//                   ),
//                   onTap: () => _onItemTapped(0),
//                 ),
//                 MyBottomNavigationBarIcons(
//                   image: Image.asset(
//                     myHomePageBottomHistoryIcon,
//                     color: _selectedIndex == 1 ? Colors.white : Colors.grey,
//                   ),
//                   onTap: () => _onItemTapped(1),
//                 ),
//                 _buildNotchedButton(),
//                 MyBottomNavigationBarIcons(
//                   image: Image.asset(
//                     myHomePageBottomAccountIcon,
//                     color: _selectedIndex == 3 ? Colors.white : Colors.grey,
//                   ),
//                   onTap: () =>
//                       {_onItemTapped(3), Get.to(() => const ProfileScreen())},
//                 ),
//                 MyBottomNavigationBarIcons(
//                   image: Image.asset(
//                     myHomePageBottomSettingsIcon,
//                     color: _selectedIndex == 4 ? Colors.white : Colors.grey,
//                   ),
//                   onTap: () => _onItemTapped(4),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNotchedButton() {
//     return SizedBox(
//       height: 47,
//       width: 47,
//       child: FloatingActionButton(
//         onPressed: () {
//           // Get.to(
//           //   // () => ItemListPage(),
//           // // );
//         },
//         backgroundColor: Colors.white,
//         child: const Icon(
//           Icons.add,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }
// }
