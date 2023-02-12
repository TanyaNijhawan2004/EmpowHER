

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class BottomSheetWidget extends StatefulWidget {
  final BuildContext ctx;
  const BottomSheetWidget({Key? key,required this.ctx}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {

  String amount = "100";
  bool isPaid = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return isPaid
      ? Container(
      height: 80.h,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Lottie.asset("assets/paymentDone.json")),
          Text(
            "Payment Successful",
            textAlign: TextAlign.center,
            style: semiBoldColorTheme_20,
          ),
          SizedBox(height:10.0),
          Text(
            "Even your smallest of contribution and empower someone's personal Hygiene. We appreciate and endorse your donation.",
            softWrap: true,
            textAlign: TextAlign.center,
            style: regularColorBlack_13,
          ),
          SizedBox(height:10.0),
          InkWell(
            onTap: () {
              Navigator.pop(widget.ctx);
            },
            child: Container(
              width: 30.w,
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: themeColor)),
              child: Text("Close", style: regularColorBlack_13),
            ),
          ),
          SizedBox(height:10.0),
        ],
      ),
    )
      : Container(
      height: 75.h,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: "You're donating to ",
                  style: regularColorBlack_13,
                ),
                TextSpan(
                  text: "Freedom for Girls",
                  style: mediumBoldColorTheme_16,
                )
              ]
          )),
          Text(
            "Thank you for showing your interest to help communities in uplifting the female community and making women financially, physically and mentally strong.",
            softWrap: true,
            textAlign: TextAlign.center,
            style: regularColorBlack_13,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Amount",
                style: regularColorBlack_13,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          amount = "100";
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: amount == "100" ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "\u{20B9} 100",
                          style: mediumBoldColorTheme_13,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          amount = "200";
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: amount == "200" ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "\u{20B9} 200",
                          style: mediumBoldColorTheme_13,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          amount = "500";
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: amount == "500" ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "\u{20B9} 500",
                          style: mediumBoldColorTheme_13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          loading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 1.5,color: themeColor,))
          : InkWell(
            onTap: () {
              setState(() {
                loading = true;
              });
              Future.delayed(const Duration(seconds: 1),(){
                setState(() {
                  isPaid = true;
                });
              });
              setState(() {
                loading = false;
              });
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 12.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: themeColor)),
              child: Text("Donate Now", style: regularColorDonateText_12),
            ),
          ),
        ],
      ),
    );
  }
}
