
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/constants.dart';
import 'package:girlpower/screens/authScreen.dart';
import 'package:girlpower/screens/mainframe.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final List<Introduction> list = [
    Introduction(
      title: 'Welcome to EmpowHER',
      subTitle: 'AI based gyaniec doctor assistant',
      imageUrl: 'assets/onboard1.png',
      titleTextStyle: boldColorTheme_20,
      subTitleTextStyle: regularColorWhite_16,
    ),
    Introduction(
      title: 'Welcome to EmpowHER',
      subTitle: 'Women Only Community platform for Support',
      imageUrl: 'assets/onboard2.png',
      titleTextStyle: boldColorTheme_20,
      subTitleTextStyle: regularColorWhite_16,
    ),
    Introduction(
      title: 'Welcome to EmpowHER',
      subTitle: 'Upliftment of Rural women hygiene in collaboration with SHGs',
      imageUrl: 'assets/onboard3.png',
      titleTextStyle: boldColorTheme_20,
      subTitleTextStyle: regularColorWhite_16,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreenOnboarding(
        introductionList: list,
        backgroudColor: scaffoldBgColor,
        foregroundColor: themeColor,
        onTapSkipButton: () {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => AuthScreen(),
            ), //MaterialPageRoute
          );
        },
        skipTextStyle: mediumBoldColorWhite_13,
      ),
    );
  }
}
