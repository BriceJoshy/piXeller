import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/image_strings.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.press,
  });
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(left: 20, top: 30),
          padding: const EdgeInsetsDirectional.all(12),
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: Image.asset(
            myHomePageBottomSideBarIcon,
            height: 32,
            width: 32,
          ),
        ),
      ),
    );
  }
}
