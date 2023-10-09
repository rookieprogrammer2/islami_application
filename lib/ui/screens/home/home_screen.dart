import 'package:flutter/material.dart';
import 'package:islami_application/ui/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/background.png',
            ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(

        ),

      ),
    );
  }
}
