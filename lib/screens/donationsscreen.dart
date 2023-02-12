import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/screens/donationdetailscreen.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h),
                Container(
                 alignment: Alignment.center,
                  child: Text(
                    "Donate for a Cause",
                    style: semiBoldColorWhite_13,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: List.generate(donationScreenList.length, (index) => Expanded(child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFFF7B0B6).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: donationScreenList[index]["icon"],
                        ),
                        SizedBox(height:10.0),
                        Text(donationScreenList[index]["text"],textAlign: TextAlign.center,style: regularColorDonationText_12,),
                      ],
                    )))
                  ),
                ),
                SizedBox(height: 3.h),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Ongoing Campaigns",
                    style: mediumBoldColorWhite_13,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 18.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color(0xFF322D2E),
                  ),
                  child: Column(
                    children: [
                        Image.asset("assets/donationBanner.png"),
                        ListTile(
                          title: Text("Freedom for Girls",style: mediumBoldColorWhite_15,softWrap: true,),
                          subtitle: Text("Girl Up Delhi",style: semiBoldColorTheme_13,),
                          trailing: GestureDetector(
                            onTap: (){
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => DonationDetailScreen()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
                              decoration: BoxDecoration(
                                color: themeColor,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Text("Donate",style: regularColorDonateText_12,),
                            ),
                          ),
                        )
                    ],
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
