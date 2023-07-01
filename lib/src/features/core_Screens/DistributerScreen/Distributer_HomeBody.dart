// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/common_widgets/Filter_categories_widget.dart';
import 'package:rive/rive.dart';

import '../../../apis/api.dart';
import '../../../constants/image_strings.dart';
import '../../authentication/screens/profilescreen/profileScreen.dart';
import '../Add_item_producer_Screen/product_page.dart';
import '../homescreen/Not_Used_homescreen.dart';
import '../on_boarding/on_boarding_screen.dart';

class DistributerHomePage extends StatefulWidget {
  const DistributerHomePage({super.key});

  @override
  State<DistributerHomePage> createState() => _DistributerHomePageState();
}

CollectionReference producerUser = APIs.firestore.collection("Users");
CollectionReference itemRefernce = APIs.firestore.collection("Item List");
DocumentReference reference = producerUser.doc(APIs.auth.currentUser!.uid);

class _DistributerHomePageState extends State<DistributerHomePage> {
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

  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xoffset, yoffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: mq.height,
              child: Column(
                children: [
                  Container(
                    color: Colors.grey.shade200,
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
                                    DocumentSnapshot docSnapshot =
                                        snapshot.data!;
                                    String fieldData =
                                        (docSnapshot.get('fullname'))
                                            .toString();
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
                                borderRadius:
                                    BorderRadius.circular(mq.height * .1),
                                child: StreamBuilder<DocumentSnapshot>(
                                  stream: reference.snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshot) {
                                    if (snapshot.hasError) {
                                      return const Icon(Icons.person_2_rounded);
                                    }
                                    if (snapshot.hasData) {
                                      DocumentSnapshot docSnapshot =
                                          snapshot.data!;
                                      String fieldData =
                                          (docSnapshot.get('image')).toString();
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Profile_Screen(
                                                          user: APIs.me),
                                                ));
                                          },
                                          child: CachedNetworkImage(
                                              width: mq.width * .12,
                                              height: mq.height * .055,
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
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 60,
                            child: CupertinoSearchTextField(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                color: Colors.black,
                                size: 30,
                              ),
                              borderRadius: BorderRadius.circular(40),
                              backgroundColor: Colors.white,
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: _searchController,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Product Category",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyFilterCategoryListWidget(
                            image: Image.asset(myClothesFilterGif),
                            name: "Clothes")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mq.height * .4,
                    child: StreamBuilder(
                      stream: itemRefernce
                          .where("id", isEqualTo: APIs.auth.currentUser!.uid)
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return const Text("Error has occurred",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ));
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot docSnapshot =
                                  snapshot.data!.docs[index];
                              String DocId = docSnapshot.id;
                              String ItemCategory =
                                  (docSnapshot.get("itemCategory")).toString();
                              String ItemName =
                                  (docSnapshot.get('itemName')).toString();
                              String ItemImage =
                                  (docSnapshot.get('image')).toString();
                              String ItemQuantity =
                                  (docSnapshot.get('itemQuantity')).toString();
                              String ItemPrice =
                                  (docSnapshot.get('itemPrice')).toString();
                              String ItemDesription =
                                  (docSnapshot.get('itemDescription'))
                                      .toString();
                              String ProducerNumber =
                                  (docSnapshot.get('producerNumber'))
                                      .toString();
                              if (ItemName.toString().toLowerCase().contains(
                                      _searchController.text.toLowerCase()) ||
                                  ItemCategory.toString()
                                      .toLowerCase()
                                      .contains(_searchController.text
                                          .toLowerCase())) {
                                return SizedBox(
                                  width: 200,
                                  // height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Card(
                                      margin: const EdgeInsets.only(
                                          left: 10, right: 10, bottom: 200),
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: InkWell(
                                        onTap: () {
                                          // Get.to(() => ProductPage(
                                          //       ProductCategory: ItemCategory,
                                          //       ProductDesription: ItemDesription,
                                          //       ProductImage: ItemImage,
                                          //       ProductName: ItemName,
                                          //       ProductPrice: ItemPrice,
                                          //       ProductQuantity: ItemQuantity,
                                          //       docId: DocId,
                                          //     ));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 110,
                                              width: 220,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: const BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  top: Radius.circular(20),
                                                ),
                                              ),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.none,
                                                imageUrl: ItemImage,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: RiveAnimation.asset(
                                      myNoSearchResultsImage),
                                );
                              }
                            },
                          );
                        }
                        return const Text("Loading...");
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                          color:
                              _selectedIndex == 1 ? Colors.white : Colors.grey,
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNotchedButton() {
    return SizedBox(
      height: 47,
      width: 47,
      child: FloatingActionButton(
        onPressed: () {
          // Get.to(
          //   () => const AddItemListPage(),
          // );
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.shopping_cart_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
