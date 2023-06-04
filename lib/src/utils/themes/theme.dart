import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/utils/themes/widget_themes/text_theme.dart';

class MyAppTheme {
  // we don't want the user to access the theme using the instance of the class so we have to make the constructor private
  MyAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light, textTheme: MyTextTheme.lightTextTheme);
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark, textTheme: MyTextTheme.darkTextTheme);
}
