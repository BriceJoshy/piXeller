// ignore_for_file: non_constant_identifier_names, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../on_boarding/on_boarding_screen.dart';

class Distributer_Product_page extends StatefulWidget {
  final String docId;
  final String ProductCategory;
  final String ProductImage;
  final String ProductName;
  final String ProductPrice;
  final String ProductQuantity;
  final String ProductDesription;
  const Distributer_Product_page(
      {super.key,
      required this.ProductCategory,
      required this.ProductImage,
      required this.ProductName,
      required this.ProductPrice,
      required this.ProductQuantity,
      required this.ProductDesription,
      required this.docId});

  @override
  State<Distributer_Product_page> createState() =>
      _Distributer_Product_pageState();
}

class _Distributer_Product_pageState extends State<Distributer_Product_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: MyAppBar ,
        );
  }
}

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
