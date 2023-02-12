import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/constants.dart';
import 'package:girlpower/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

int? initScreen;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = (preferences.getInt('initScreen'));
  await preferences.setInt('initScreen', 1);
  await Firebase.initializeApp();
  runApp(const EmpowHerApp());
}

class EmpowHerApp extends StatelessWidget {
  const EmpowHerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context,orientation,deviceSize) => MaterialApp(
        title: 'EmpowHER',
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBgColor
        ),
        home: SplashScreen(),
      ),
    );
  }
}

