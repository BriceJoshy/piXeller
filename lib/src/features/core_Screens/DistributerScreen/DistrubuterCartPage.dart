import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

import '../../../apis/api.dart';
import '../../../constants/image_strings.dart';
import '../../authentication/screens/profilescreen/profileScreen.dart';
import '../Add_item_producer_Screen/product_page.dart';
import '../homescreen/Not_Used_homescreen.dart';
import '../on_boarding/on_boarding_screen.dart';
import '../splash_screen/splashscreen.dart';

var addedproductID;

class DistrubuterCartPage extends StatefulWidget {
  const DistrubuterCartPage({super.key});

  @override
  State<DistrubuterCartPage> createState() => _DistrubuterCartPageState();
}

CollectionReference producerUser = APIs.firestore.collection("Users");
CollectionReference itemRefernce = APIs.firestore.collection("Item List");
DocumentReference reference = producerUser.doc(APIs.auth.currentUser!.uid);

class _DistrubuterCartPageState extends State<DistrubuterCartPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
          "My Cart",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: mq.height,
          child: Column(
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
                      "My Favorites",
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
                      .where("itemAdded", isEqualTo: true)
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
                                        addedproductID = DocId;
                                        removeProductFav(addedproductID);
                                      },
                                      icon: const Icon(
                                        Icons.remove_circle,
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
                        myHomePageBottomBidIcon,
                        color: _selectedIndex == 4 ? Colors.white : Colors.grey,
                      ),
                      onTap: () => _onItemTapped(4),
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
          Get.snackbar("Same Page", "You are already in the cart page",
              colorText: Colors.white, backgroundColor: Colors.red);
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

Future<void> removeProductFav(addedproductID) async {
  try {
    // Reference the document using its ID
    DocumentReference documentRef =
        APIs.firestore.collection('Item List').doc(addedproductID);

    // Update specific fields
    await documentRef.update({
      'itemAdded': false,
      // Add more fields to update as needed
    });

    Get.snackbar("Product Removed!", "Check your cart for the removed products",
        colorText: Colors.white, backgroundColor: Colors.green);
  } catch (error) {
    Get.snackbar("SomeThing went wrong", "Please try again",
        colorText: Colors.white, backgroundColor: Colors.red);
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
