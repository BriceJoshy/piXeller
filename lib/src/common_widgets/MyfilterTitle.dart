import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFilterTitle extends StatelessWidget {
  const MyFilterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey.shade200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.filter_1),
            Text(
              "Clothes",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
