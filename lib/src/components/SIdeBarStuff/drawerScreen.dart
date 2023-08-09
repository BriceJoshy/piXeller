import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/features/authentication/screens/profilescreen/profileScreen.dart';
import 'package:mini_project_1/src/features/core_Screens/DistributerScreen/DistributerdrawerScreen.dart';
import 'package:mini_project_1/src/features/core_Screens/DistributerScreen/distibuter_homeDrawerScreen.dart';
import 'package:mini_project_1/src/features/core_Screens/bidding_pages/Producer/Producer_bidding%20page.dart';
import 'package:mini_project_1/src/repository/authentication_repository/authendication_repository.dart';

import '../../apis/api.dart';
import '../../features/core_Screens/on_boarding/on_boarding_screen.dart';
import '../../features/core_Screens/splash_screen/splashscreen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

CollectionReference producerUser = APIs.firestore.collection("Users");
DocumentReference reference = producerUser.doc(APIs.auth.currentUser!.uid);

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff3a4054),
      padding: const EdgeInsets.only(top: 55, bottom: 70, left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
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
                      String fieldData = (docSnapshot.get('image')).toString();
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
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          fieldData,
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        );
                      }
                      return const Text("Loading...");
                    },
                  ),
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
                        String fieldData = (docSnapshot.get('role')).toString();
                        return Text(
                          fieldData,
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        );
                      }
                      return const Text("Loading...");
                    },
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => Profile_Screen(user: APIs.me));
                },
                child: const MyListTile(
                  icon: Icon(
                    Icons.person_2_rounded,
                    color: Colors.white,
                  ),
                  name: "Profle",
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const Producer_bidding_page());
                },
                child: const MyListTile(
                  icon: Icon(
                    Icons.attach_money_rounded,
                    color: Colors.white,
                  ),
                  name: "Bidding Area",
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const DistributerHome_DrawerPage());
                },
                child: const MyListTile(
                  icon: Icon(
                    Icons.shopping_bag_rounded,
                    color: Colors.white,
                  ),
                  name: "Distributer Area",
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 30,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: SizedBox(
              height: 55,
              width: 150,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 0,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  AuthenticationRepository.instance.logout();
                  // firebaseUser = await await _auth.currentUser();
                },
                icon: const Icon(Icons.logout_outlined),
                label: const Text("LogOut"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final Icon icon;
  final String name;
  const MyListTile({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 7,
        ),
        Text(
          name,
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}
