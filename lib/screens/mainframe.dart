import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/constants.dart';
import 'package:girlpower/screens/authScreen.dart';
import 'package:girlpower/screens/communityscreen.dart';
import 'package:girlpower/screens/donationsscreen.dart';
import 'package:girlpower/screens/errorscreen.dart';
import 'package:girlpower/screens/onboardingscreen.dart';
import 'package:sizer/sizer.dart';

import 'homeScreen.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  State<MainFrame> createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  final List<Widget> _mainScreens = [
    HomeScreen(),
    CommunityScreen(),
    const DonationsScreen(),
  ];

  int selectedIndex = 0;

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Icon(
          Icons.messenger,
          color: Colors.white,
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Icon(
          Icons.messenger,
          color: themeColor,
        ),
      ),
      label: "Questions",
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Icon(
          Icons.people_outline,
          color: Colors.white,
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Icon(
          Icons.people_outline,
          color: themeColor,
        ),
      ),
      label: "Community",
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Icon(
          CupertinoIcons.gift,
          color: Colors.white,
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Icon(
          CupertinoIcons.gift,
          color: themeColor,
        ),
      ),
      label: "Donations",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _mainScreens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF282828),
          items: _items,
          currentIndex: selectedIndex,
          selectedItemColor: themeColor,
          unselectedItemColor: Colors.white,
          onTap: (int val) {
            setState(() {
              selectedIndex = val;
            });
          },
        ));
  }
}

