import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/constants.dart';
import 'package:girlpower/widgets/commentTextWidget.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../secrets.dart';
import 'package:intl/intl.dart';

class CommentScreen extends StatefulWidget {
  final String postID;
  final String post;
  const CommentScreen({Key? key,required this.postID,required this.post}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("posts").doc(widget.postID).snapshots(),
          builder: (context,snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Container(
                height: 100.h,
                color: Colors.black38,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.0,
                  ),
                ),
              );
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 30.h,
                  elevation: 0,
                  snap: true,
                  pinned: true,
                  floating: true,
                  collapsedHeight: 30.h,
                  flexibleSpace: Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF322D2E),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: TextEditingController(text: widget.post),
                                  style: mediumBoldColorWhite_13,
                                  maxLines: 4,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                height: 10,
                              ),
                              //const SizedBox(height:5.0),
                            ],
                          ),
                        ),
                      ),
                     CommentTextWidget(postID: widget.postID),
                    ],
                  ),
                  backgroundColor: Colors.transparent,
                ),
                //3
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, int index) {
                      return snapshot.data == null || snapshot.data!.data() == null || snapshot.data!.data()!.isEmpty
                          ? Center(
                        child: Text(
                          "No Comments Yet",
                          style: mediumBoldColorWhite_13,
                        ),
                      )
                          : Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF322D2E),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Posted on ",
                                    style: regularColorText_13,
                                  ),
                                  TextSpan(
                                    text: DateFormat.yMd().format(snapshot.data!.data()!["comments"][index]["added-at"].toDate()),
                                    style: mediumBoldColorTheme_13,
                                  ),
                                ])),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              snapshot.data!.data()!["comments"][index]["comment"],style: regularColorWhite_12,),
                          ],
                        ),
                      );
                    },
                    childCount: snapshot.data!.data()!["comments"].length,
                  ),
                ),
              ],
            );
          },
        )
      ),
    );
  }
}
