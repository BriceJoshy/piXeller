import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';
import 'package:rive/rive.dart';

import '../../../../apis/api.dart';
import '../../on_boarding/on_boarding_screen.dart';

class ItemDisplayCard extends StatefulWidget {
  const ItemDisplayCard({
    super.key,
  });

  @override
  State<ItemDisplayCard> createState() => _ItemDisplayCardState();
}

CollectionReference itemRefernce = APIs.firestore.collection("Item List");

// DocumentReference reference = itemRefernce.doc();

class _ItemDisplayCardState extends State<ItemDisplayCard> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0.5,
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => ChatScreen(
          //       user: widget.user,
          //     ),
          //   ),
          // );
        },
        child: StreamBuilder(
          stream:
              itemRefernce.where("id", isEqualTo: APIs.user.uid).snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: RiveAnimation.asset(myNoSearchResultsImage),
              );
            }
            if (snapshot.hasData) {
              DocumentSnapshot docSnapshot = snapshot.data!;
              String fieldData = (docSnapshot.get('itemName')).toString();
              return InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const ProfilePage(),
                  //     ));
                },
                child: Text(
                  fieldData,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return const Text("Loading...");
          },
        ),
      ),
    );
  }
}
