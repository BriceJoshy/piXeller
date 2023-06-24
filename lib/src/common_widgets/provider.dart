import 'package:flutter/material.dart';

class TagProvider with ChangeNotifier {
  void changeMenu() {
    notifyListeners();
  }
}
