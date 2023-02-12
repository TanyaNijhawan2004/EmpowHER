import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/constants.dart';
import 'package:girlpower/screens/commentscreen.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../secrets.dart';
import '../widgets/postTextWidget.dart';

class CommunityScreen extends StatefulWidget {
  CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("posts").orderBy("time-posted",descending: true).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
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
                    expandedHeight: 28.h,
                    elevation: 0,
                    snap: true,
                    pinned: true,
                    floating: true,
                    collapsedHeight: 28.h,
                    flexibleSpace: PostTextWidget(),
                    backgroundColor: Colors.transparent,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, int index) {
                      return snapshot.data == null || snapshot.data!.docs.isEmpty
                              ? Center(
                                  child: Text(
                                    "No Posts Yet",
                                    style: mediumBoldColorWhite_13,
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF322D2E),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: "Posted by ",
                                          style: regularColorText_13,
                                        ),
                                        TextSpan(
                                          text: "Anonymous ",
                                          style: mediumBoldColorText_13,
                                        ),
                                        TextSpan(
                                          text: "on ",
                                          style: regularColorText_13,
                                        ),
                                        TextSpan(
                                          text: DateFormat.yMd().format(snapshot.data!.docs[index]["time-posted"].toDate()),
                                          style: mediumBoldColorTheme_13,
                                        ),
                                      ])),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]
                                            ["post-content"],
                                        style: regularColorWhite_12,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      CommentScreen(
                                                        postID: snapshot.data!
                                                            .docs[index].id,
                                                        post: snapshot.data!
                                                                .docs[index]
                                                            ["post-content"],
                                                      )));
                                        },
                                        child: Row(children: [
                                          const Icon(
                                            Icons.chat_bubble_outline,
                                            color: Color(0xFFE9E9E9),
                                            size: 20.0,
                                          ),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            "${snapshot.data!.docs[index]["comments"].length}",
                                            style: regularColorText_13,
                                          )
                                        ]),
                                      ),
                                    ],
                                  ),
                                );
                    }, childCount: snapshot.data!.docs.length),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
