import 'package:flutter/material.dart';
import 'package:islami_application/ui/screens/contents/contents.dart';
import 'package:islami_application/ui/screens/home/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        Contents.routeName : (_) => Contents(),
      },
      initialRoute: HomeScreen.routeName,

    );
  }

}
