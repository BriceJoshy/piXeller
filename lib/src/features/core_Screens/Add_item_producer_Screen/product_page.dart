// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project_1/src/apis/api.dart';
import 'package:mini_project_1/src/constants/colors.dart';

import '../on_boarding/on_boarding_screen.dart';

var UrlImage;
var ProductCategoryvalue;
final _ProductFormKey = GlobalKey<FormState>();

class ProductPage extends StatefulWidget {
  final String docId;
  final String ProductCategory;
  final String ProductImage;
  final String ProductName;
  final String ProductPrice;
  final String ProductQuantity;
  final String ProductDesription;
  const ProductPage(
      {super.key,
      required this.ProductCategory,
      required this.ProductImage,
      required this.ProductName,
      required this.ProductPrice,
      required this.ProductQuantity,
      required this.ProductDesription,
      required this.docId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String ProductDropdownvalue = 'Clothes';
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _image;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: const Icon(
      //       Icons.arrow_back_ios_new_rounded,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: mq.height * 1.1,
                  width: mq.width,
                  decoration: const BoxDecoration(
                    color: Color(0xff3a4054),
                  ),
                ),
                const Divider()
              ],
            ),
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Container(
                height: mq.height * 2,
                width: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Form(
                    key: _ProductFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.category_rounded,
                              color: Colors.black,
                            ),
                            label: Text("Item Category"),
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                          value: ProductDropdownvalue,
                          onChanged: (String? newValue) {
                            setState(() {
                              ProductDropdownvalue = newValue!;
                              ProductCategoryvalue = ProductDropdownvalue;
                            });
                          },
                          items: <String>[
                            'Clothes',
                            'Fruits',
                            'Vegetables',
                            'Paintings',
                            'Garden Center'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 16),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _itemNameController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(25),
                              labelText: "Item Name",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.shopping_basket_rounded,
                                color: Colors.black,
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2.0, color: Colors.black),
                              )
                              // iconColor: Colors.black),
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _quantityController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(25),
                              labelText: "Quantity",
                              prefixIcon: Icon(
                                  Icons.format_list_numbered_rounded,
                                  color: Colors.black),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black))
                              // iconColor: Colors.black),
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _priceController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(25),
                              labelText: "Price",
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.price_change_rounded,
                                    color: Colors.black),
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2.0, color: Colors.black),
                              )
                              // iconColor: Colors.black),
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(25),
                              labelText: "Description",
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.info_rounded,
                                    color: Colors.black),
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2.0, color: Colors.black),
                              )
                              // iconColor: Colors.black),
                              ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_ProductFormKey.currentState!.validate()) {
                              updateProductInfo().then((value) => Get.snackbar(
                                  "Product Updated",
                                  "Please go to back to home page see updated information"));
                            }
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Add Item",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 110, horizontal: 79),
              child: Stack(
                children: [
                  // ternary operator
                  _image != null
                      ? Container(
                          clipBehavior: Clip.hardEdge,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          // borderRadius: BorderRadius.circular(mq.height * 1),
                          child: Image.file(
                            File(_image!),
                            width: mq.height * .3,
                            height: mq.height * .3,
                            fit: BoxFit.cover,
                          ),
                        )
                      // profile picture
                      : Container(
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
                                const Icon(Icons.person),
                          ),
                        ),

                  // would be able to customize to our needs
                  // also a small buttom so it will look good too
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: MaterialButton(
                      elevation: 1,
                      onPressed: () {
                        _showBottomSheet();
                      },
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 60,
              left: 25,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Text(
                    "Product Details",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> updateProductPicture(File file) async {
    final ext = file.path.split('.').last;
    log('Extension: $ext');

    // storage file ref with path
    final ref = APIs.storage.ref().child('product_pictures/${APIs.user.uid}.');

    // uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
      // printing the bytes and /1000 for kb calculation
      log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
    });
    log(widget.docId);
    log("111");
    UrlImage = await ref.getDownloadURL();
    log(UrlImage + "--why?");
    await APIs.firestore.collection('Item List').doc(widget.docId).update({
      'image': UrlImage,
      // "image" keyword from json file or check the firebase
    });
  }

  void _showBottomSheet() {
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
              "Pick Profile Picture",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: mq.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    // Pick an image.
                    final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery, imageQuality: 80);
                    // Capture a photo.
                    if (image != null) {
                      log('Image Path: ${image.path} --MimeType: ${image.mimeType}');
                      setState(() {
                        _image = image.path;
                      });
                    }
                    updateProductPicture(File(_image!));
                    // for hiding the bottem sheet
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      fixedSize: Size(mq.width * .3, mq.height * 0.15)),
                  child: Image.asset(
                    'assets/images/gallery.gif',
                    height: mq.height * .3,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    // Pick an image.
                    final XFile? image = await picker.pickImage(
                        source: ImageSource.camera, imageQuality: 80);
                    // Capture a photo.
                    if (image != null) {
                      log('Image Path: ${image.path}');
                      setState(() {
                        _image = image.path;
                      });
                    }
                    updateProductPicture(File(_image!));
                    // for hiding the bottem sheet
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      fixedSize: Size(mq.width * .3, mq.height * 0.15)),
                  child: Image.asset(
                    'assets/images/camera.gif',
                    height: mq.height * .3,
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }

  Future<void> updateProductInfo() async {
    await APIs.firestore.collection('Item List').doc(widget.docId).update({
      'itemCategory': ProductCategoryvalue,
      'itemName': _itemNameController.text.trim(),
      'itemQuantity': _quantityController.text.trim(),
      'itemPrice': _priceController.text.trim(),
      'itemDescription': _descriptionController.text.trim(),
    });
  }
}
