import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Widget image;
  const ProductCard({super.key, required this.image});

//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   Product product;
//   @override
//   void initState() {
//     product = widget.product;
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 65),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              right: 0,
              bottom: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              children: <Widget>[
                // const SizedBox(height: 15),
                image
                // SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
