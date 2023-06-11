import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TagProvider with ChangeNotifier {
  void changeMenu() {
    notifyListeners();
  }
}
