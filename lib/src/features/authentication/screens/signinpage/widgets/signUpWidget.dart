import 'package:flutter/material.dart';

class signUpWidget extends StatefulWidget {
  signUpWidget({
    super.key,
  });

  @override
  State<signUpWidget> createState() => _signUpWidgetState();
}

class _signUpWidgetState extends State<signUpWidget> {
  String dropdownValue = 'Producer';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
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
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(25),
                  labelText: "Phone No",
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
            )
          ],
        ),
      ),
    );
  }
}
