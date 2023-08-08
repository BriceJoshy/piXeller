// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

import '../../../../apis/api.dart';
import '../../../../constants/image_strings.dart';
import '../../../authentication/screens/profilescreen/profileScreen.dart';
import '../../Add_item_producer_Screen/addItemListPage.dart';
import '../../Add_item_producer_Screen/product_page.dart';
import '../../Models/AddItemlist_Model/add_item_list_model.dart';
import '../../splash_screen/splashscreen.dart';
import '../Not_Used_homescreen.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

CollectionReference producerUser = APIs.firestore.collection("Users");
CollectionReference itemRefernce = APIs.firestore.collection("Item List");
DocumentReference reference = producerUser.doc(APIs.auth.currentUser!.uid);

class _HomePageBodyState extends State<HomePageBody> {
  // ignore: prefer_final_fields, unused_field
  List<AddItemListModel> _list = [];

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
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
      ),
      child: SingleChildScrollView(
        child: SizedBox(
          height: mq.height,
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
                    SizedBox(width: mq.width * 0.15),
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
                      "My Products",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * .6,
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
                              (docSnapshot.get('itemDescription')).toString();
                          if (ItemName.toString()
                              .toLowerCase()
                              .contains(_searchController.text.toLowerCase())) {
                            return Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: mq.width * .04, vertical: 4),
                              color: Colors.grey.shade100,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 0.5,
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => ProductPage(
                                        ProductCategory: ItemCategory,
                                        ProductDesription: ItemDesription,
                                        ProductImage: ItemImage,
                                        ProductName: ItemName,
                                        ProductPrice: ItemPrice,
                                        ProductQuantity: ItemQuantity,
                                        docId: DocId,
                                      ));
                                },
                                child: SizedBox(
                                  height: 90,
                                  child: ListTile(
                                    shape: ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    tileColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 1),
                                    leading: Padding(
                                      padding: const EdgeInsets.only(left: 13),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(4.0)),
                                          child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: ItemImage),
                                        ),
                                      ),
                                    ),
                                    title: Text(ItemName),
                                    subtitle: Text(
                                      "Price:$ItemQuantity\n"
                                      "Quantity:$ItemPrice",
                                      textAlign: TextAlign.left,
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        deleteDocument(DocId);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child:
                                  RiveAnimation.asset(myNoSearchResultsImage),
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
              Container(
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
                          color:
                              _selectedIndex == 0 ? Colors.white : Colors.grey,
                        ),
                        onTap: () {
                          _onItemTapped(0);
                          Get.snackbar("At Home Screen",
                              "You are already at the home screen",
                              colorText: Colors.white,
                              backgroundColor: Colors.blue);
                        }),
                    MyBottomNavigationBarIcons(
                        image: Image.asset(
                          myHomePageBottomHistoryIcon,
                          color:
                              _selectedIndex == 1 ? Colors.white : Colors.grey,
                        ),
                        onTap: () {
                          _onItemTapped(1);
                          Get.snackbar(
                              "Refreshed", "You have refreshed the page",
                              colorText: Colors.white,
                              backgroundColor: Colors.blue);
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
                        myHomePageBottomBidIcon,
                        color: _selectedIndex == 4 ? Colors.white : Colors.grey,
                      ),
                      onTap: () {
                        _onItemTapped(4);
                      },
                    ),
                  ],
                ),
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

  Future<void> deleteDocument(String DocumentId) async {
    try {
      // Delete the document
      await APIs.firestore
          .collection("Item List")
          .doc(DocumentId)
          .delete()
          .then((value) => Get.snackbar(
              "Product Deleted", "Deleted successfully",
              colorText: Colors.white, backgroundColor: Colors.green));
    } catch (e) {
      print('Error deleting document: $e');
    }
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
