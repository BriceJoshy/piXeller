import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/apis/api.dart';
import 'package:mini_project_1/src/authentication_repository/authendication_repository.dart';
import 'package:mini_project_1/src/components/configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

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
              const CircleAvatar(
                radius: 30,
                child: Icon(Icons.person_2_rounded),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Brice Joshy',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Text('Producer',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500))
                ],
              )
            ],
          ),
          Column(
            children: drawerItems
                .map(
                  (element) => Padding(
                    padding:
                        const EdgeInsets.only(left: 6.0, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          element['icon'],
                          color: Colors.white,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          element['title'],
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
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
