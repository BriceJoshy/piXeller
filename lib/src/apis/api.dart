import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../features/authentication/models/user_login_model.dart';
import '../features/core_Screens/Models/AddItemlist_Model/add_item_list_model.dart';
import '../repository/authentication_repository/authendication_repository.dart';

class APIs {
  // the following are the objects made

  // for authentication
  static FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  // for storing self information
  static late AppUser me;

  // for storing item information
  static late AddItemListModel itemDetails;

  // to return current user
  static User get user => auth.currentUser!;

  // for accessing firebase messaging (push notifications)
  static FirebaseMessaging fmessaging = FirebaseMessaging.instance;

  static Future<bool> userExits() async {
    return (await firestore
            .collection('Users')
            .doc(auth.currentUser!
                .uid) // using the uid from the gmail login from firestore as the document id
            .get())
        .exists;
  }

  // for getting current user info
  static Future<void> getSelfInfo() async {
    // using the uid from the gmail login from firestore as the document id
    await firestore.collection('Users').doc(auth.currentUser!.uid).get().then(
      (user) async {
        if (user.exists) {
          me = AppUser.fromJson(user.data()!);
          // if user exits then, but we got the json data so we have to parse it
          log('My Data: ${user.data()}');
        } else {
          print("failed${auth.currentUser!.uid}");
          // create a new user
          // await because this funcion should wait for some time
          // getSelfInfo is like a loop
          // await createUser().then((value) => getSelfInfo());
        }
      },
    );
  }

  // Get phone no from user and pass it to auth repository for fireabase authentication

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  // for creating a new user
  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final newAppUser = AppUser(
      id: user.uid,
      role: '',
      userType: '',
      fullname: '',
      phoneNo: '',
      email: '',
      password: '',
      about: "Hey I'm using piXeller .",
      image: 'https://stock.adobe.com/search?k=person+icon',
      createdAt: time,
    );

    // push this info above to the firebase to make document
    // using the uid from the gmail login from firestore as the document id
    return (await firestore
        .collection('Users')
        .doc(user.uid)
        .set(newAppUser.toJson()));
  }

  // for updating user information
  static Future<void> updateUserInfo() async {
    await firestore.collection('Users').doc(user.uid).update({
      'name': me.fullname,
      'about': me.about,
      'phoneNo': me.phoneNo,
      'email': me.email,
    });
  }

  static Future<void> updateProfilePictre(File file) async {
    // calling a child for path
    // creating a path to the  folder profile_pictures to store the profile pictures
    // then storing images and that image name will be equal to user's uid to pervent storing duplicate images
    // first of all there should be a file that is uploaded from the user  to be accepted
    // passing a "file" from dart.io
    // after that getting an extension from that particular "file"\
    // so we use final ext (extenstion) and take the stuff after the '.' (dot part) and print it using log (for error checking)
    // this returns the file extention
    // now creating a reference "ref"
    final ext = file.path.split('.').last;
    log('Extension: $ext');
    //  storage.ref().child('profile_pictures/${user.uid}.');

    // storage file ref with path
    final ref = storage.ref().child('profile_pictures/${user.uid}.');
    // there will be no data so we nedd to push it out i.e simply passing that file and it will work
    // if we wnat setting the meta data
    // this function takes a lot of time i.e why "await" is used ,once this function is executed then execute some more code
    // i.e then provides the snapshot data

    // uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
      // printing the bytes and /1000 for kb calculation
      log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
    });
    // updating the "me.image"
    // as it takes a lot of time "await" keyword is used
    // check image is final from "chat user page"
    // this is used to update image in firestore database
    me.image = await ref.getDownloadURL();
    await firestore.collection('Users').doc(user.uid).update({
      'image': me.image, // "image" keyword from json file or check the firebase
    });
  }

  static Future<void> updateItemPicture(File file) async {
    final ext = file.path.split('.').last;
    log('Extension: $ext');

    // storage file ref with path
    final ref = storage.ref().child('item_pictures/${user.uid}.');

    // uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
      // printing the bytes and /1000 for kb calculation
      log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
    });

    itemDetails.image = await ref.getDownloadURL();
    await firestore.collection('Items').doc(user.uid).update({
      'image': itemDetails
          .image, // "image" keyword from json file or check the firebase
    });
  }

  // update online or last active status
  // future void i.e why no "return"
  // for getting specific user info
  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(
      AppUser app_User) {
    return firestore
        .collection('Users')
        .where('id', isEqualTo: app_User.id)
        .snapshots();
  }
}
