import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/constants.dart';
import 'package:girlpower/screens/doctorscreen.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../secrets.dart';

class AnswerScreen extends StatelessWidget {
  final String questionPrompt;
  AnswerScreen({Key? key, required this.questionPrompt}) : super(key: key);

  String answer = "";

  Future<void> generateAnswers() async {
    final bodyMap = {
      "model": "text-davinci-003",
      "prompt": "Write a 200 words summary on ${questionPrompt}",
      "max_tokens": 3000,
      "temperature": 0.8,
      "top_p": 1,
      "frequency_penalty": 0.0,
      "presence_penalty": 0.0,
    };
    http.Response response = await http.post(
        Uri.parse(
          "https://api.openai.com/v1/completions",
        ),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $apiSecret",
        },
        body: jsonEncode(bodyMap));
    answer = jsonDecode(response.body)["choices"][0]["text"];
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          child: Column(
            children: [
              SizedBox(height: 3.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Icon(
                        Icons.navigate_before,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        "HerGPT",
                        style: semiBoldColorWhite_13,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Text("Q. $questionPrompt", style: regularColorTheme_13),
              ),
              Expanded(
                  child: FutureBuilder(
                      future: generateAnswers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.0,
                            ),
                          );
                        }
                        return ListView(
                children: [

                          Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 0.0),
                              child: Text(
                               answer,
                                style: regularColorText_13,
                              ),
                            ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text("Want More Personalised Help ?",
                            style: semiBoldColorWhite_13),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => DoctorScreen()));
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(color: themeColor)),
                          child: Text("Consult Doctor", style: mediumBoldColorTheme_13),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: themeColor,
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(color: themeColor)),
                          child: Text("Ask Another Question",
                              style: mediumBoldColorBlack_13),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                ],
              );
                    }
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
