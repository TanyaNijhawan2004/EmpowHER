import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/constants.dart';
import 'package:girlpower/screens/authScreen.dart';
import 'package:girlpower/screens/errorscreen.dart';
import 'package:girlpower/screens/mainframe.dart';
import 'package:girlpower/screens/onboardingscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
   Timer(Duration(seconds: 3), () async{
     final refs = await SharedPreferences.getInstance();
     bool? unauthorized = refs.getBool("unauthorised");
     if(mounted){
       Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context){
         if (initScreen == 0 || initScreen == null){
           return OnboardingScreen();
         }
         else {
           if (user != null) {
             if(unauthorized!){
               return ErrorScreen();
             }
             return MainFrame();
           } else {
             return AuthScreen();
           }
         }
       }));
     }
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Image.asset("assets/mainlogo.png",fit: BoxFit.cover,width: 40.w,),
        ),
      ),
    );
  }
}
