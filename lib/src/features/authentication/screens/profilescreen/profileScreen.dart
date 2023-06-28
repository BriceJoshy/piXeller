import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/features/authentication/models/user_login_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            // future: controller.getUserData(),
            builder: (context, snapshot) {
              // if the data is
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  AppUser userData = snapshot.data as AppUser;
                  final fullname = TextEditingController(text: userData.name);
                  final email = TextEditingController(text: userData.email);
                  final phoneNo = TextEditingController(text: userData.phoneNo);
                  final password =
                      TextEditingController(text: userData.password);
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color(0xff3a4054),
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Brice Joshy",
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "bricejoshy99@gmail.com",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: fullname,
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
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.black),
                                  )
                                  // iconColor: Colors.black),
                                  ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: phoneNo,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(25),
                                  labelText: "Phone No (with +91)",
                                  prefixIcon:
                                      Icon(Icons.phone, color: Colors.black),
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
                              controller: email,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(25),
                                  labelText: "Email",
                                  prefixIcon:
                                      Icon(Icons.mail, color: Colors.black),
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
                              controller: password,
                              // obscureText: true,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(25),
                                  labelText: "Password",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.password_rounded,
                                        color: Colors.black),
                                  ),
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.black),
                                  )
                                  // iconColor: Colors.black),
                                  ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide.none,
                                    shape: ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    backgroundColor: const Color(0xff3a4054)),
                                onPressed: () async {},
                                child: const Text("Edit Profile"),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "Joined",
                                    style: const TextStyle(fontSize: 13),
                                    children: [
                                      const TextSpan(text: "  "),
                                      TextSpan(
                                        text: "31 June 2023",
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.redAccent.withOpacity(0.1),
                                      elevation: 0,
                                      foregroundColor: Colors.red,
                                      shape: const StadiumBorder(),
                                      side: BorderSide.none),
                                  onPressed: () {},
                                  child: const Text("Delete"),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("SOmething went wrong."),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
