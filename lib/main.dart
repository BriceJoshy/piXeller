import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_1/src/common_widgets/provider.dart';
import 'package:mini_project_1/src/features/authentication/screens/splash_screen/splashscreen.dart';
import 'package:mini_project_1/src/utils/themes/theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

var size, height, width;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return ChangeNotifierProvider(
      create: (context) => TagProvider(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        //  for light theme
        theme: MyAppTheme.lightTheme,
        darkTheme: MyAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const splash_screen(),
      ),
    );
  }
}
