import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/features/authentication/screens/profilescreen/profileScreen.dart';
import 'package:mini_project_1/src/features/core_Screens/Models/AddItemlist_Model/add_item_list_model.dart';

import '../../../apis/api.dart';
import '../splash_screen/splashscreen.dart';

final _formKeyItem = GlobalKey<FormState>();
var ItemDropdownvalue;

class AddItemListPage extends StatefulWidget {
  const AddItemListPage({super.key});

  @override
  State<AddItemListPage> createState() => _AddItemListPageState();
}

class _AddItemListPageState extends State<AddItemListPage> {
  String addItemDropdownvalue = 'Clothes';
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
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
          "Add Item",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKeyItem,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: mq.height * 0.2,
                  width: mq.width * 0.5,
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://ecomworld.shop/uploads/default-product.png"),
                ),
                SizedBox(
                  height: 50,
                  child: Text(
                    "'You can add an image after adding an item'",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
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
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  value: addItemDropdownvalue,
                  onChanged: (String? newValue) {
                    setState(() {
                      addItemDropdownvalue = newValue!;
                      ItemDropdownvalue = addItemDropdownvalue;
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
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
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
                      prefixIcon: Icon(Icons.format_list_numbered_rounded,
                          color: Colors.black),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.black))
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
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
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
                        child: Icon(Icons.info_rounded, color: Colors.black),
                      ),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
                      )
                      // iconColor: Colors.black),
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKeyItem.currentState!.validate()) {
                      addItemList().then((value) => Get.snackbar("Item Added",
                          "Please go to back to see the item you've added",
                          colorText: Colors.white,
                          backgroundColor: Colors.green));
                    } else {
                      Get.snackbar("Item Not Added", "Please try again",
                          colorText: Colors.white, backgroundColor: Colors.red);
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
    );
  }

  Future<void> addItemList() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final newItemAdded = AddItemListModel(
        id: APIs.user.uid,
        itemCategory: ItemDropdownvalue,
        itemName: _itemNameController.text.trim(),
        itemQuantity: _quantityController.text.trim(),
        itemPrice: _priceController.text.trim(),
        producerNumber: ProducerPhoneNumber.toString(),
        image: "https://ecomworld.shop/uploads/default-product.png",
        producerWarning: "0",
        itemDescription: _descriptionController.text.trim(),
        itemAdded: false,
        createdAt: time);

    // push this info above to the firebase to make document
    // using the uid from the gmail login from firestore as the document id
    await APIs.firestore
        .collection('Item List')
        .doc()
        .set(newItemAdded.toJson());
  }
}
