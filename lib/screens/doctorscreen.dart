import 'dart:math';

import 'package:flutter/material.dart';
import 'package:girlpower/constants.dart';
import 'package:sizer/sizer.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 3.h),
            Row(
              children: [
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.navigate_before,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Doctors",
                      style: semiBoldColorWhite_13,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: FutureBuilder(
              future: Future.delayed(Duration(seconds: 2)),
              builder: (context,snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(strokeWidth: 1.0,color: Colors.white,),);
                }
                return ListView(
                  children: List.generate(doctorsInfo.length, (index){
                    return  Container(
                      margin:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF322D2E),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(doctorsInfo[index]["image"]),
                        ),
                        title: Text(
                          doctorsInfo[index]["name"],
                          style: mediumBoldColorTheme_16,
                        ),
                        subtitle: Text(
                          "Timings : ${doctorsInfo[index]["timing"]}",
                          style: mediumBoldColorText_10,
                        ),
                        trailing: const Icon(
                          Icons.schedule,
                          color: themeColor,
                        ),
                      ),
                    );
                  }),
                );
              }
            ))
          ],
        ),
      ),
    );
  }
}
