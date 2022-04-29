import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/modules/main_screens/complains_screen.dart';
import 'package:hotel/modules/main_screens/profile_screen.dart';
import '../modules/main_screens/home_screen.dart';
import '../modules/main_screens/settings_screen.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int? currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    // const LocationScreen(),
     ProfileScreen(),
    const ComplainsScreen(),
    //const SettingsScreen(),
    const SettingPageUi(),
  ];

  List<Widget> creens = [
    const Icon(
      Icons.home_outlined,
      size: 35,
      color: Colors.black,
    ),
    // const Icon(
    //   Icons.location_on_outlined,
    //   size: 35,
    //   color: Colors.black,
    // ),
    const Icon(
      Icons.account_circle_outlined,
      size: 35,
      color: Colors.black,
    ),
    const Icon(
      Icons.headset_mic_outlined,
      size: 35,
      color: Colors.black,
    ),
    const Icon(
      Icons.format_list_bulleted_outlined,
      size: 35,
      color: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex!],
      bottomNavigationBar: CurvedNavigationBar(
        //buttonBackgroundColor: Colors.grey,
        color: Colors.grey,
        backgroundColor: Colors.white,
        items: creens,
        index: currentIndex!,
        onTap: (index) {
          setState(() {});
          currentIndex = index;
        },
        height: 60,
      ),
    );
  }
}