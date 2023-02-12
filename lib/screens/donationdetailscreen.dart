import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girlpower/widgets/bottomsheet.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class DonationDetailScreen extends StatefulWidget {
  const DonationDetailScreen({Key? key}) : super(key: key);

  @override
  State<DonationDetailScreen> createState() => _DonationDetailScreenState();
}

class _DonationDetailScreenState extends State<DonationDetailScreen> {

    showPaymentBottomSheet() async {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      builder: (context) => BottomSheetWidget(ctx: context,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h),
                Row(
                  children: [
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
                          "Freedom for Girls",
                          style: semiBoldColorWhite_13,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Image.asset("assets/donationBanner.png"),
                const SizedBox(height: 10),
                Text(
                  "Freedom for Girls",
                  style: mediumBoldColorWhite_15,
                  softWrap: true,
                ),
                const SizedBox(height: 10),
                Text(
                  "Girl Up Delhi",
                  style: semiBoldColorTheme_13,
                ),
                const SizedBox(height: 10),
                Text(
                  "We work to support those who menstruate by challenging the stigmas, taboos and gender inequalities associated "
                  "with menstruation. We do this by providing education, providing period products, promoting product choice "
                  "and supporting environmentally and financially sustainable options.",
                  style: regularColorText_13,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "2000+ Donations",
                      style: mediumBoldColorDonationText_13,
                    ),
                    Column(
                      children: [
                        Text(
                          "Total Amount Raised",
                          style: mediumBoldColorDonationText_13,
                        ),
                        Text(
                          "\u{20B9} 2,00,000.00",
                          style: mediumBoldColorTheme_16,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                InkWell(
                  onTap: () async {
                    await showPaymentBottomSheet();
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: themeColor)),
                    child: Text("Donate Now", style: regularColorDonateText_12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
