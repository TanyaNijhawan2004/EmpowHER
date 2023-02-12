

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import '../constants.dart';
import '../secrets.dart';

class CommentTextWidget extends StatefulWidget {
  final String postID;
  const CommentTextWidget({Key? key,required this.postID}) : super(key: key);

  @override
  State<CommentTextWidget> createState() => _CommentTextWidgetState();
}

class _CommentTextWidgetState extends State<CommentTextWidget> {
  final TextEditingController _commentController = TextEditingController();
  bool isLoading = false;

  Future<bool> analyzeText() async {
    final bodyMap = {
      "input": _commentController.text,
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

  Future<void> addComment() async {
    setState(() {
      isLoading = true;
    });
    if (_commentController.text.isEmpty) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Post Can't be Empty.")));
      return;
    }
    final isGoodPost = await analyzeText();
    if (isGoodPost) {
      final result = await FirebaseFirestore.instance.collection("posts").doc(widget.postID).get();
      final docContents = result.data() as Map<String,dynamic>;
      List commentList = docContents["comments"];
      commentList.add({
        "comment" : _commentController.text,
        "added-at" : DateTime.now(),
      });
      await FirebaseFirestore.instance.collection("posts").doc(widget.postID).set({
        "comments": commentList,
      },SetOptions(
        merge: true,
      ),);
      FocusScope.of(context).unfocus();
      _commentController.clear();
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
    return  Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 4.0),
      decoration: BoxDecoration(
        color: const Color(0xFF322D2E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _commentController,
        style: mediumBoldColorWhite_13,
        cursorColor: Colors.white,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon:
            isLoading
                ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: themeColor,strokeWidth: 1.0,))
                : GestureDetector(
              onTap: () async{
                await addComment();
              },
              child: const Icon(
                Icons.send,
                color: themeColor,
              ),
            ),
            hintText: "Send Help ..",
            hintStyle: semiBoldColorHintText_12),
      ),
    );
  }
}
