import 'package:cloud_firestore/cloud_firestore.dart';

class AddItemModel {
  final String? id;
  final String category;
  final String itemName;
  final String price;
  final String quantity;
  final String producer_Phno;
  final String image;

  const AddItemModel({
    this.id,
    required this.category,
    required this.itemName,
    required this.price,
    required this.quantity,
    required this.producer_Phno,
    required this.image,
  });

  toJson() {
    return {
      "Category": category,
      "ItemName": itemName,
      "Price": price,
      "Quantity": quantity,
      "Ph no": producer_Phno,
      "ImageURL": image,
    };
  }

  /// Step 1-Map user fetched from Firebase to UserModel
  factory AddItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    // fetch the data
    final data = document.data()!;
    return AddItemModel(
        id: document.id,
        category: data["Category"],
        itemName: data["ItemName"],
        price: data["Price"],
        quantity: data["Quantity"],
        producer_Phno: data["Ph no"],
        image: data["ImageURL"]);
  }
}
