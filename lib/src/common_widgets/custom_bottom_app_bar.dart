import 'package:flutter/material.dart';

class NotchedBottomNavigationBar extends StatefulWidget {
  @override
  _NotchedBottomNavigationBarState createState() =>
      _NotchedBottomNavigationBarState();
}

class _NotchedBottomNavigationBarState
    extends State<NotchedBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: ClipPath(
        clipper: BottomAppBarClipper(),
        child: BottomNavigationBar(
          backgroundColor: Color(0xff3a4054).withOpacity(0.8),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class BottomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width * 0.35, 0);
    path.arcToPoint(
      Offset(size.width * 0.65, 0),
      radius: Radius.circular(size.width * 0.15),
      clockwise: false,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
