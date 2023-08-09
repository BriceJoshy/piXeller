// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/features/core_Screens/bidding_pages/Producer/producer_Item_Edit_stuff.dart';
import 'package:mini_project_1/src/features/core_Screens/homescreen/homedrawerScreen/homedrawerScreen.dart';
import 'package:rive/rive.dart';
import '../../../../apis/api.dart';
import '../../../../constants/image_strings.dart';
import '../../../authentication/screens/profilescreen/profileScreen.dart';
import '../../splash_screen/splashscreen.dart';
import 'Distributer_Bidding_Item_Display_stuff.dart';

class Distributer_bidding_page extends StatefulWidget {
  const Distributer_bidding_page({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Distributer_bidding_pageState createState() =>
      _Distributer_bidding_pageState();
}

CollectionReference producerUser = APIs.firestore.collection("Users");
CollectionReference itemRefernce = APIs.firestore.collection("Bid Item List");
DocumentReference reference = producerUser.doc(APIs.auth.currentUser!.uid);

class _Distributer_bidding_pageState extends State<Distributer_bidding_page> {
  // ignore: prefer_final_fields, unused_field
  // List<AddBidListModel> _list = [];

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
  int bidAmount = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void incrementBid() {
    setState(() {
      bidAmount += 50;
    });
  }

  void decrementBid() {
    setState(() {
      bidAmount -= 50;
    });
  }

  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                )),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Bid Item",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: SizedBox(
          height: mq.height * 0.9,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: 50,
                      child: CupertinoSearchTextField(
                        backgroundColor: Colors.white,
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: _searchController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "My Bids",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Place Bids by clicking the dollar symbol",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mq.height * .6,
                    child: StreamBuilder(
                      stream: itemRefernce.snapshots(),
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
                              String ProducerNum =
                                  (docSnapshot.get('producerNumber'))
                                      .toString();
                              if (ItemName.toString().toLowerCase().contains(
                                  _searchController.text.toLowerCase())) {
                                return Card(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: mq.width * .04, vertical: 4),
                                  color: Colors.grey.shade100,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 0.5,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() =>
                                          Distributer_Bidding_Product_Display_page(
                                            ProductCategory: ItemCategory,
                                            ProductDesription: ItemDesription,
                                            ProductImage: ItemImage,
                                            ProductName: ItemName,
                                            ProductPrice: ItemPrice,
                                            ProductQuantity: ItemQuantity,
                                            docId: DocId,
                                            ProducerNumber: ProducerNum,
                                          ));
                                    },
                                    child: SizedBox(
                                      height: 90,
                                      child: ListTile(
                                        shape: ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        tileColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 1),
                                        leading: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 13),
                                          child: AspectRatio(
                                            aspectRatio: 1,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(4.0)),
                                              child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: ItemImage),
                                            ),
                                          ),
                                        ),
                                        title: Text(ItemName),
                                        subtitle: Text(
                                          "Current Bid:$ItemPrice\n",
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        trailing: Column(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                _showBottomSheet(
                                                    DocId, ItemPrice);
                                              },
                                              icon: const Icon(
                                                Icons.attach_money_rounded,
                                                color: Colors.orange,
                                                size: 30,
                                              ),
                                            ),
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
                  const Spacer(),
                ],
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                            color: _selectedIndex == 0
                                ? Colors.white
                                : Colors.grey,
                          ),
                          onTap: () {
                            _onItemTapped(0);
                            Get.to(() => const HomeDrawerScreen());
                          }),
                      MyBottomNavigationBarIcons(
                          image: Image.asset(
                            myHomePageBottomHistoryIcon,
                            color: _selectedIndex == 1
                                ? Colors.white
                                : Colors.grey,
                          ),
                          onTap: () {
                            _onItemTapped(1);
                            Get.snackbar(
                                "Refreshed", "You have refreshed the page",
                                colorText: Colors.white,
                                backgroundColor: Colors.blue);
                          }),
                      // _buildNotchedButton(),
                      MyBottomNavigationBarIcons(
                        image: Image.asset(
                          myHomePageBottomAccountIcon,
                          color:
                              _selectedIndex == 3 ? Colors.white : Colors.grey,
                        ),
                        onTap: () {
                          _onItemTapped(3);
                          Get.to(() => Profile_Screen(user: APIs.me));
                        },
                      ),
                      MyBottomNavigationBarIcons(
                        image: Image.asset(
                          myHomePageBottomBidIcon,
                          color:
                              _selectedIndex == 4 ? Colors.white : Colors.grey,
                        ),
                        onTap: () {
                          _onItemTapped(4);
                          Get.snackbar("At Bid Page",
                              "You are already in the bidding page",
                              colorText: Colors.white,
                              backgroundColor: Colors.blue);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(DocID, ItemPrice) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (_) {
        return ListView(
          shrinkWrap: true,
          padding:
              EdgeInsets.only(top: mq.height * .03, bottom: mq.height * .05),
          children: [
            const Text(
              "Bid Amount",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: mq.height * .02,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        if (bidAmount >= 50) {
                          decrementBid();
                        }
                      },
                      child: const Icon(
                        Icons.remove_circle,
                        size: 40,
                      ),
                    ),
                    Text(
                      bidAmount.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    MaterialButton(
                      onPressed: () {
                        incrementBid();
                      },
                      child: const Icon(
                        Icons.add_circle,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      updateBidPrice(DocID, ItemPrice, bidAmount);
                    },
                    child: Text(
                      "Place Bid",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ))
              ],
            )
          ],
        );
      },
    );
  }
}

Future<void> updateBidPrice(DocId, ItemPrice, int bidAmount) async {
  if (int.parse(ItemPrice) < bidAmount) {
    await APIs.firestore.collection('Bid Item List').doc(DocId).update({
      'itemPrice': bidAmount,
    });
  } else {
    Get.snackbar("Bid Too Low", "Make more bid value");
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
