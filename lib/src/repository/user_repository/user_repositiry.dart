import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_1/src/apis/api.dart';
import 'package:mini_project_1/src/features/authentication/models/user_login_model.dart';

//  this user repository is going to contain all the queries related to the firestore related to the user
//  C,R,U,D, get all users, etx
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // now we are pointing to the root of the database
  // _db meas it is private
  final _db = APIs.firestore;

  // having the values from the User Model
  // first we call the collections inside collection
  // we want "Users" collection to "add something"
  // i,.e a document of users
  // we need to convert the usermodel to map of string and dybamic
  // that means to convert to jso
  // Step 1 - Store User in Firebase
  createUser(UserModel user) async {
    // await is going to waiit for this query to complete
    await _db.collection("Users").add(user.toJson()).whenComplete(() {
      Get.snackbar("Sucess", "YourAccount has been created.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    }).catchError(
      // ignore: avoid_types_as_parameter_names, body_might_complete_normally_catch_error, non_constant_identifier_names
      (error, StackTrace) {
        Get.snackbar("Error", "Some went wrong. Try again",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
        // ignore: avoid_print
        print(error.toString());
      },
    );
  }

  // Step 2 - Fetch All User Or User details
  //  for single record
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    //  now we have the data inside the snapshot
    // then we need to map the data to convert it to document snapshot then to list or to single records
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  //  for multiple record
  Future<List<UserModel>> getallUsers() async {
    final snapshot = await _db.collection("Users").get();
    //  now we have the data inside the snapshot
    // then we need to map the data to convert it to document snapshot then to list or to single records
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }
}
