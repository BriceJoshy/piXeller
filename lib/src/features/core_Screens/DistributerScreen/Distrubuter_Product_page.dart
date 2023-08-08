// ignore_for_file: non_constant_identifier_names, camel_case_types, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../apis/api.dart';
import '../on_boarding/on_boarding_screen.dart';
import '../splash_screen/splashscreen.dart';

var addingProductId;

class Distributer_Product_page extends StatefulWidget {
  final String docId;
  final String ProductCategory;
  final String ProductImage;
  final String ProductName;
  final String ProductPrice;
  final String ProductQuantity;
  final String ProductDesription;
  final String ProducerNumber;
  const Distributer_Product_page(
      {super.key,
      required this.ProductCategory,
      required this.ProductImage,
      required this.ProductName,
      required this.ProductPrice,
      required this.ProductQuantity,
      required this.ProductDesription,
      required this.docId,
      required this.ProducerNumber});

  @override
  State<Distributer_Product_page> createState() =>
      _Distributer_Product_pageState();
}

class _Distributer_Product_pageState extends State<Distributer_Product_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  minRadius: 20,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    minRadius: 19,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.report_gmailerrorred,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.grey.shade300,
            leading: Padding(
              padding:
                  const EdgeInsets.only(top: 8, right: 8, left: 6, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            elevation: 0,
            pinned: true,
            centerTitle: true,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.grey.shade400, BlendMode.darken),
                    child: const Image(
                      height: 270,
                      image: AssetImage(
                        myveges,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: CachedNetworkImage(
                            width: mq.height * .3,
                            height: mq.height * .3,
                            fit: BoxFit.cover,
                            imageUrl: widget.ProductImage,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.wifi_tethering_error_sharp),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.ProductName,
                          style: GoogleFonts.poppins(
                              fontSize: mq.height * 0.032,
                              fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.check_box),
                                    Text(
                                      "High Quality",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.check_box),
                                    Text(
                                      "Better Price",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                thickness: 1.5,
                color: Colors.black,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₹${widget.ProductPrice}",
                    style: TextStyle(
                      fontSize: mq.height * 0.032,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 198, 89, 0),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      addingProductId = widget.docId;
                      updateAddedFields(addingProductId);
                    },
                    color: const Color.fromARGB(255, 198, 89, 0),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(10),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.add,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  widget.ProductDesription,
                  style: TextStyle(
                    fontSize: mq.height * 0.021,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(149, 0, 0, 0),
                  ),
                )),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    backgroundColor: Colors.black,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () async {
                    final Uri url =
                        Uri(scheme: 'tel', path: widget.ProducerNumber);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      Get.snackbar(
                        "Try Again",
                        "Something went wrong",
                        colorText: Colors.white,
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  child: Text(
                    "Call Producer",
                    style: GoogleFonts.poppins(
                        fontSize: mq.height * 0.032,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

Future<void> updateAddedFields(addingProductId) async {
  try {
    // Reference the document using its ID
    DocumentReference documentRef =
        APIs.firestore.collection('Item List').doc(addingProductId);

    // Update specific fields
    await documentRef.update({
      'itemAdded': true,
      // Add more fields to update as needed
    });

    Get.snackbar("Product Added!", "Check your cart for the added products",
        colorText: Colors.white, backgroundColor: Colors.green);
  } catch (error) {
    Get.snackbar("SomeThing went wrong", "Please try again",
        colorText: Colors.white, backgroundColor: Colors.red);
  }
}
