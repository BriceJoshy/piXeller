import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              const SizedBox(width: 50),
              Text(
                "Hi!   Brice Joshy",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 120),
              const CircleAvatar(
                child: Icon(Icons.person_2_rounded),
              )
            ],
          )
        ],
      ),
    );
  }
}
