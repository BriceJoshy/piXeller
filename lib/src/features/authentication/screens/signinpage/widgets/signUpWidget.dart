import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/apis/api.dart';
import 'package:mini_project_1/src/features/core_Screens/homescreen/homedrawerScreen/homedrawerScreen.dart';
import '../../../../../repository/authentication_repository/authendication_repository.dart';
import '../../../models/user_login_model.dart';

final _formKey = GlobalKey<FormState>();
var Dropdownvalue;
var userType;

class signUpWidget extends StatefulWidget {
  signUpWidget({
    super.key,
  });

  @override
  State<signUpWidget> createState() => _signUpWidgetState();
}

class _signUpWidgetState extends State<signUpWidget> {
  String dropdownValue = 'Producer';
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SignUpController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.work,
                  color: Colors.black,
                ),
                label: Text("Role"),
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  Dropdownvalue = dropdownValue;
                });
              },
              items: <String>['Producer', 'Distributer']
                  .map<DropdownMenuItem<String>>((String value) {
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
              controller: _fullnameController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(25),
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person_2_outlined,
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
              controller: _phoneNoController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(25),
                  labelText: "Phone No (with +91)",
                  prefixIcon: Icon(Icons.phone, color: Colors.black),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.black))
                  // iconColor: Colors.black),
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(25),
                  labelText: "Email",
                  prefixIcon: Icon(Icons.mail, color: Colors.black),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.black))
                  // iconColor: Colors.black),
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(25),
                  labelText: "Password",
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.password_rounded, color: Colors.black),
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
                if (_formKey.currentState!.validate()) {
                  // SignUpController.instance.registerUser(
                  //     controller.email.text.trim(),
                  //     controller.password.text.trim());
                  // /*###### phone authentication ######*/
                  // AuthenticationRepository.instance
                  //     .phoneAuthentication(_phoneNoController.text.trim());
                  // Get.to(const OTPScreen());
                  AuthenticationRepository.instance
                      .createUserWithEmailAndPassword(
                          _emailController.text.trim(),
                          _passwordController.text.trim())
                      .then((value) {
                    Get.to(() => const HomeDrawerScreen());
                  }).onError((error, stackTrace) {
                    Get.snackbar(
                        colorText: Colors.white,
                        backgroundColor: Colors.red,
                        "User Already Exist${error}",
                        "Please go to login page");
                  });

                  // SignUpController.instance.createUser(user);
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    if (Dropdownvalue == "producer") {
      userType = 0;
    } else {
      userType = 1;
    }
    final newAppUser = AppUser(
      id: _fullnameController.text.trim() + _phoneNoController.text.trim(),
      role: Dropdownvalue,
      userType: userType.toString(),
      fullname: _fullnameController.text.trim(),
      phoneNo: _phoneNoController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      about: "Hey I'm using piXeller .",
      image: 'https://stock.adobe.com/search?k=person+icon',
      createdAt: time,
    );

    // push this info above to the firebase to make document
    // using the uid from the gmail login from firestore as the document id
    await APIs.firestore
        .collection('Users')
        .doc(APIs.auth.currentUser!.uid)
        .set(newAppUser.toJson());
  }
}
