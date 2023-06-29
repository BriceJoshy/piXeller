import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project_1/src/constants/colors.dart';
import 'package:mini_project_1/src/features/authentication/screens/signinpage/signinpage.dart';

import '../../../../apis/api.dart';
import '../../../../helper/dialogs.dart';
import '../../../../repository/authentication_repository/authendication_repository.dart';
import '../../models/user_login_model.dart';

var screenWidth, screenHeight;

// statefull widget as we are dynamically changing it
class Profile_Screen extends StatefulWidget {
  final AppUser user;

  const Profile_Screen({super.key, required this.user});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  // specifiying the form state is stored
  final _formKey = GlobalKey<FormState>(); // setting the form key
  String? _image;
  // List<ChatUser> list = [];
  // not final as there is chance that the list is initialized many times

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    screenWidth = mq.size.width;
    screenHeight = mq.size.height;
    return GestureDetector(
      // for hiding the keboard
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          //appbar
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                )),
            title: Text(
              'Profile',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            centerTitle: true,
          ),

          //floating action button to add new user
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: FloatingActionButton.extended(
              backgroundColor: Colors.redAccent,
              onPressed: () async {
                // for showing progress dialog
                Dialogs.showProgressBar(context);
                // user signout
                // before signout set active status to false

                AuthenticationRepository.instance.logout().then((value) =>
                    Get.snackbar("Logged Out", "Hope to see you again🥲"));
              },
              icon: const Icon(Icons.login_outlined),
              label: const Text('Logout'),
            ),
          ),

          // builds list item for every user
          body: Form(
            // if  "key: _formKey," has not being done then the control of the form key will go to all of them
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // for adding some space
                    SizedBox(
                      width: screenWidth * 0.02,
                      height: screenHeight * .03,
                    ),
                    // for user profile pic
                    Stack(
                      children: [
                        // ternary operator
                        _image != null
                            ? ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * .1),
                                child: Image.file(
                                  File(_image!),
                                  width: screenHeight * .2,
                                  height: screenHeight * .2,
                                  fit: BoxFit.cover,
                                ),
                              )
                            // profile picture
                            : ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * .1),
                                child: CachedNetworkImage(
                                  width: screenHeight * .2,
                                  height: screenHeight * .2,
                                  fit: BoxFit.cover,
                                  imageUrl: widget.user.image,
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
                          right: 0,
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
                    // for adding some space
                    SizedBox(
                      height: screenHeight * .05,
                    ),
                    // name text form field
                    TextFormField(
                      initialValue: widget.user.fullname,
                      onSaved: (val) => APIs.me.fullname = val ?? '',
                      // we save ourself we want to store is so onSaveed
                      // stored in val , it can be null bavlue ie why ''
                      validator: (val) => val != null && val.isNotEmpty
                          ? null
                          : 'Required Field', // checking out value is correct or not
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(25),
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: "eg. John Smith",
                          label: Text('Name')),
                    ),
                    SizedBox(
                      height: screenHeight * .02,
                    ),
                    // about text form field
                    TextFormField(
                      initialValue: widget.user.about,
                      onSaved: (val) => APIs.me.about = val ?? '',
                      // we save ourself we want to store is so onSaveed
                      // stored in val , it can be null bavlue ie why ''
                      validator: (val) => val != null && val.isNotEmpty
                          ? null
                          : 'Required Field', // checking out value is correct or not
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(25),
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                          prefixIcon: Icon(
                            Icons.info_outline,
                            color: Colors.black,
                          ),
                          hintText: "Feeling Happy",
                          label: Text('About')),
                    ),
                    SizedBox(
                      height: screenHeight * .02,
                    ),
                    TextFormField(
                      initialValue: widget.user.email,
                      onSaved: (val) => APIs.me.email = val ?? '',
                      // we save ourself we want to store is so onSaveed
                      // stored in val , it can be null bavlue ie why ''
                      validator: (val) => val != null && val.isNotEmpty
                          ? null
                          : 'Required Field', // checking out value is correct or not
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(25),
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                          prefixIcon: Icon(
                            Icons.mail_outline_rounded,
                            color: Colors.black,
                          ),
                          hintText: "emailname@gmail.com",
                          label: Text('Email')),
                    ),
                    SizedBox(
                      height: screenHeight * .02,
                    ),
                    TextFormField(
                      initialValue: widget.user.phoneNo,
                      onSaved: (val) => APIs.me.phoneNo = val ?? '',
                      // we save ourself we want to store is so onSaveed
                      // stored in val , it can be null bavlue ie why ''
                      validator: (val) => val != null && val.isNotEmpty
                          ? null
                          : 'Required Field', // checking out value is correct or not
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(25),
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          hintText: "+913438483482",
                          label: Text('Phone No')),
                    ),
                    // about text form field

                    SizedBox(
                      height: screenHeight * .05,
                    ),
                    // update button
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Get.snackbar("Details Updated",
                              "Your profile determines your future",
                              colorText: Colors.white,
                              backgroundColor: Colors.green);
                          APIs.updateUserInfo();
                          log('inside validator');
                        }
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 28,
                      ),
                      label: const Text(
                        'UPDATE',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: myPrimaryColor,
                          shape: const StadiumBorder(),
                          minimumSize:
                              Size(screenWidth * .5, screenHeight * .06)),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  // bottom sheet for picking a profile pic from user
  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                top: screenHeight * .03, bottom: screenHeight * .05),
            children: [
              const Text(
                "Pick Profile Picture",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: screenHeight * .02,
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
                      APIs.updateProfilePictre(File(_image!));
                      // for hiding the bottem sheet
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        fixedSize: Size(screenWidth * .3, screenHeight * 0.15)),
                    child: Image.asset(
                      'assets/images/gallery.gif',
                      height: screenHeight * .3,
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
                      APIs.updateProfilePictre(File(_image!));
                      // for hiding the bottem sheet
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        fixedSize: Size(screenWidth * .3, screenHeight * 0.15)),
                    child: Image.asset(
                      'assets/images/camera.gif',
                      height: screenHeight * .3,
                    ),
                  )
                ],
              )
            ],
          );
        });
  }
}
