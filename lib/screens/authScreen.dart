import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/constants.dart';
import 'package:girlpower/screens/answerscreen.dart';
import 'package:girlpower/screens/errorscreen.dart';
import 'package:girlpower/screens/mainframe.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final authResult = await _auth.signInWithCredential(credential);
    User? user = authResult.user;
    return user;
  }

  Future<bool> getGender() async {
    String? name = _googleSignIn.currentUser!.displayName;
    if(name == null){
      return false;
    } else {
      final firstName = name.split(" ")[0];
      final result= await http.get(Uri.parse("https://api.genderize.io?name=$firstName"),
      );
      final response = jsonDecode(result.body);
      if(response["gender"] ==  "male" || response["gender"] == null){
        return false;
      } else if(response["gender"] == "female" && response["probability"] < 0.65)  {
        return false;
      } else {
        return true;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                child: Text("Log in",style: semiBoldColorTheme_32,),
              ),
              SizedBox(height: 3.h,),
              InkWell(
                onTap: () async{
                  User? finalUser = await signInWithGoogle();
                  if(finalUser == null){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No User Selected",style: mediumBoldColorWhite_13,),backgroundColor: Colors.orangeAccent));
                    return ;
                  } else {
                    final isFemale = await getGender();
                    if(isFemale){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => MainFrame()));
                    } else {
                      final refs = await SharedPreferences.getInstance();
                      refs.setBool("unauthorised", true);
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => ErrorScreen()));
                    }
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF525252).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Image.asset("assets/google.png",height: 20.0,width: 20.0,),
                         const SizedBox(width: 10.0),
                        Text("Continue with Google",style: regularColorDark_16)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 100.0,
                        child: Divider(color: colorDark,thickness: 1.0,)),
                    Text(" or " ,style: regularColorDark_16,),
                    const SizedBox(
                        width: 100.0,
                        child: Divider(color: colorDark,thickness: 1.0,)),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/apple.png",height: 20.0,width: 20.0,),
                    const SizedBox(width: 10.0),
                    Text("Continue with Apple",style: regularColorBlack_16)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                padding: const EdgeInsets.symmetric(vertical : 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A66AC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/facebook.png",height: 20.0,width: 20.0,color: Colors.white,),
                    const SizedBox(width: 10.0),
                    Text("Continue with Facebook",style: regularColorWhite_16)
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

