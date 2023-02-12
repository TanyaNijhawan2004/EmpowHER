import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/constants.dart';
import 'package:girlpower/screens/answerscreen.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen({Key? key}) : super(key: key);

  final TextEditingController _questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Lottie.asset("assets/error.json")),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: "Sorry, ",
                    style: semiBoldColorTheme_20,
                  ),
                  TextSpan(
                    text: "you are not ",
                    style: semiBoldColorBlack_20,
                  ),
                  TextSpan(
                    text: "authorised ",
                    style: semiBoldColorTheme_20,
                  ),
                  TextSpan(
                    text: "to view this page.",
                    style: semiBoldColorBlack_20,
                  ),
                ]
              )),
              SizedBox(height: 10.h,)
            ],
          )
        ),
      ),
    );
  }
}
