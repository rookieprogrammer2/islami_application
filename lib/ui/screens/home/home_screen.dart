import 'package:flutter/material.dart';
import 'package:islami_application/ui/screens/home/tabs/azkar_tab.dart';
import 'package:islami_application/ui/screens/home/tabs/quran_tab.dart';
import 'package:islami_application/ui/screens/home/tabs/radio_tab.dart';
import 'package:islami_application/ui/screens/home/tabs/sebha_tab.dart';
import 'package:islami_application/ui/utils/app_colors.dart';
import 'package:islami_application/ui/utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int currentTabIndex = 0;
  List<Widget> tabs = [
    const AzkarTab(),
    const RadioTab(),
    const SebhaTab(),
    const QuranTab(),
  ];

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
        body: tabs[currentTabIndex],
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
              "Islamic",
          style: AppTheme.appBarTextStyle,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: bottomNavigationBar(),

      ),
    );
  }

  Widget bottomNavigationBar () => Theme(
    data: ThemeData(
      canvasColor: AppColors.primary,
    ),
    /*
    Instead of hard-coding the current active tab -currentIndex- to a specific
    tab, which does not make sense because then the app would only always have
    one tab available, you create a variable, initialize it to 0, set the
    currentIndex parameter of the BottomNavigationBar to the currentTabIndex var
    you just created, and then finally, using the onTap parameter, which takes
    an int -'index'- and performs a function. That function should change the
    currentTabIndex value from zero -which is the variable that is responsible for
    changing the 'currentTabIndex' parameter which controls the active tab- to the
    number of the index of the 'BottomNavigationBarItem', thereby changing the
    active tab.

    => The screen starts with the current tab -currentTabIndex- being set to 0, which
     is the "Azkar" tab according to the indices of the items below.
    => Using the "onTap" function, the "currentIndex" value is going to be swapped
     with the value of the index of the respective ButtomNavigationBarItem,
     thereby changing the User Interface.
     */
    child: BottomNavigationBar(
      currentIndex: currentTabIndex,
      onTap: (index) {
        currentTabIndex = index;
        setState(() {});
      },
      showUnselectedLabels: true,
      unselectedFontSize: 15,
      selectedFontSize: 15,
      selectedItemColor: AppColors.accent,
      iconSize: 32,
      items:  const [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/ic_azkar.png"),),label: "Azkar"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/ic_radio.png"),),label: "Radio"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/ic_sebha.png"),),label: "Sebha"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/svg_quran.png"),),label: "Quran"),
      ],
    ),
  );
}
