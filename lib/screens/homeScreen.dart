import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/constants.dart';
import 'package:girlpower/screens/answerscreen.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 3.h),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "EmpowHer",
                    style: semiBoldColorWhite_20,
                  ),
                ),
                SizedBox(height: 6.h),
                Column(
                  children: [
                    Text(
                      "Ask Your Questions !",
                      textAlign: TextAlign.center,
                      style: mediumBoldColorTheme_24,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Featured Questions",
                      textAlign: TextAlign.center,
                      style: mediumBoldColorWhite_17,
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Column(
                  children: List.generate(
                      promptQuestions.length,
                      (index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => AnswerScreen(
                                          questionPrompt:
                                              promptQuestions[index])));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 35.0, vertical: 8.0),
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFF322D2E),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    promptQuestions[index],
                                    softWrap: true,
                                    style: mediumBoldColorText_13,
                                  )),
                                  const Icon(
                                    Icons.navigate_next_outlined,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          )),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Ask your Own Questions",
                  textAlign: TextAlign.center,
                  style: mediumBoldColorWhite_17,
                ),
                SizedBox(height: 2.h),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF322D2E),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                    controller: _questionController,
                    style: mediumBoldColorWhite_13,
                    cursorColor: Colors.white,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (_questionController.text.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "Please enter a question",
                                  style: mediumBoldColorWhite_13,
                                ),
                                backgroundColor: Colors.orangeAccent,
                              ));
                              return;
                            }
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => AnswerScreen(
                                        questionPrompt:
                                            _questionController.text)));
                          },
                          child: const Icon(
                            Icons.send,
                            color: themeColor,
                          ),
                        ),
                        hintText: "How can I help you...",
                        hintStyle: semiBoldColorHintText_12),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
