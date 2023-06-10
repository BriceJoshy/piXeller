import 'package:flutter/material.dart';
import 'package:mini_project_1/src/features/authentication/screens/login_page/animated.dart';
import 'package:mini_project_1/src/features/authentication/screens/login_page/login_page%20copy.dart';
import 'package:mini_project_1/src/utils/themes/theme.dart';

import 'src/features/authentication/screens/on_boarding/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  for light theme
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: LoginForm(),
    );
  }
}
