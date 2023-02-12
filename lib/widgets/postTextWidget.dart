

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import '../constants.dart';
import '../secrets.dart';

class PostTextWidget extends StatefulWidget {
  const PostTextWidget({Key? key}) : super(key: key);

  @override
  State<PostTextWidget> createState() => _PostTextWidgetState();
}

class _PostTextWidgetState extends State<PostTextWidget> {

  final TextEditingController _postController = TextEditingController();
  bool isLoading = false;

  Future<bool> analyzeText() async {
    final bodyMap = {
      "input": _postController.text,
    };
    try {
      http.Response response = await http.post(
          Uri.parse(
            "https://api.openai.com/v1/moderations",
          ),
          headers: {
            "Content-type": "application/json",
            "Authorization": "Bearer $apiSecret",
          },
          body: jsonEncode(bodyMap));
      final result = jsonDecode(response.body);
      final categoryWise = result["results"][0]["categories"];
      if (categoryWise["hate"] ||
          categoryWise["violence"] ||
          categoryWise["hate/threatening"] ||
          categoryWise["violence/graphic"]) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> createPost() async {
    setState(() {
      isLoading = true;
    });
    if (_postController.text.isEmpty) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Post Can't be Empty.")));
      return;
    }
    final isGoodPost = await analyzeText();
    if (isGoodPost) {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection("posts").add({
        "post-content": _postController.text,
        "time-posted": DateTime.now(),
        "posted-by": user!.uid,
        "comments": []
      });
      FocusScope.of(context).unfocus();
      _postController.clear();
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Post Declined due to violation of rules.")));
      return;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            "Her Community",
            style: semiBoldColorWhite_13,
          ),
        ),
        Expanded(
          child: Container(
            //height: 20.h,
            margin: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 15.0),
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 8.0),
            decoration: BoxDecoration(
              color: const Color(0xFF322D2E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _postController,
                    style: mediumBoldColorWhite_13,
                    maxLines: 4,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: "What's Happening ..",
                      hintStyle: semiBoldColorHintText_12,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                isLoading
                ? const CircularProgressIndicator(color: themeColor,strokeWidth: 1.0,)
                : InkWell(
                  onTap: () async {
                    await createPost();
                  },
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: themeColor)),
                    alignment: Alignment.center,
                    child: Text(
                      "Post",
                      style: mediumBoldColorTheme_13,
                    ),
                  ),
                ),
                //const SizedBox(height:5.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
