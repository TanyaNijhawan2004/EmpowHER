import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const scaffoldBgColor = Color(0xFF1D1415);
const themeColor = Color(0xFFF7B0B6);
const questionTextColor = Color(0xFFE1DFDF);
const hintTextColor = Color(0xFF828282);
const colorDark = Color(0xFF969696);
const donationTextColor = Color(0xFF9D9D9D);
const donateText = Color(0xFF8E2427);


final regular = GoogleFonts.poppins(color: Colors.black);
final semiBold = GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600);
final mediumBold = GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w500);
final bold = GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600);

final mediumBoldColorTheme = mediumBold.copyWith(color: themeColor);
final mediumBoldColorTheme_10 = mediumBoldColorTheme.copyWith(fontSize: 10.0);
final mediumBoldColorTheme_13 = mediumBoldColorTheme.copyWith(fontSize: 13.0);
final mediumBoldColorTheme_16 = mediumBoldColorTheme.copyWith(fontSize: 16.0);
final mediumBoldColorTheme_24 = mediumBoldColorTheme.copyWith(fontSize: 24.0);

final mediumBoldColorDonationText = mediumBold.copyWith(color: donationTextColor);
final mediumBoldColorDonationText_10 = mediumBoldColorDonationText.copyWith(fontSize: 10.0);
final mediumBoldColorDonationText_13 = mediumBoldColorDonationText.copyWith(fontSize: 13.0);

final regularColorTheme = regular.copyWith(color: themeColor);
final regularColorTheme_13 = regularColorTheme.copyWith(fontSize: 13.0);

final regularColorDonationText = regular.copyWith(color:donationTextColor );
final regularColorDonationText_12 = regularColorDonationText.copyWith(fontSize: 12.0);

final regularColorWhite = regular.copyWith(color: Colors.white);
final regularColorWhite_12 = regularColorWhite.copyWith(fontSize: 12.0);
final regularColorWhite_14 = regularColorWhite.copyWith(fontSize: 14.0);
final regularColorWhite_16 = regularColorWhite.copyWith(fontSize: 16.0);

final regularColorBlack = regular.copyWith(color: Colors.black);
final regularColorBlack_13 = regularColorBlack.copyWith(fontSize: 13.0);
final regularColorBlack_16 = regularColorBlack.copyWith(fontSize: 16.0);

final regularColorDark = regular.copyWith(color: colorDark);
final regularColorDark_16 = regularColorDark.copyWith(fontSize: 16.0);

final mediumBoldColorWhite = mediumBold.copyWith(color: Colors.white);
final mediumBoldColorWhite_10 = mediumBoldColorWhite.copyWith(fontSize: 10.0);
final mediumBoldColorWhite_13 = mediumBoldColorWhite.copyWith(fontSize: 13.0);
final mediumBoldColorWhite_15 = mediumBoldColorWhite.copyWith(fontSize: 15.0);
final mediumBoldColorWhite_17 = mediumBoldColorWhite.copyWith(fontSize: 17.0);

final mediumBoldColorBlack = mediumBold.copyWith(color: Colors.black);
final mediumBoldColorBlack_13 = mediumBoldColorBlack.copyWith(fontSize: 13.0);

final regularColorText = regular.copyWith(color: Colors.white);
final regularColorText_13 = regularColorText.copyWith(fontSize: 13.0);

final regularColorDonateText = regular.copyWith(color: donateText);
final regularColorDonateText_12 = regularColorDonateText.copyWith(fontSize: 12.0);

final mediumBoldColorText = mediumBold.copyWith(color: Colors.white);
final mediumBoldColorText_13 = mediumBoldColorText.copyWith(fontSize: 13.0);
final mediumBoldColorText_10 = mediumBoldColorText.copyWith(fontSize: 10.0);

final semiBoldColorWhite =semiBold.copyWith(color: questionTextColor);
final semiBoldColorWhite_13 = semiBoldColorWhite.copyWith(fontSize: 13.0);
final semiBoldColorWhite_20 = semiBoldColorWhite.copyWith(fontSize: 20.0);

final semiBoldColorBlack =semiBold.copyWith(color: Colors.black);
final semiBoldColorBlack_13 = semiBoldColorBlack.copyWith(fontSize: 13.0);
final semiBoldColorBlack_20 = semiBoldColorBlack.copyWith(fontSize: 20.0);

final semiBoldColorTheme =semiBold.copyWith(color: themeColor);
final semiBoldColorTheme_13 = semiBoldColorTheme.copyWith(fontSize: 13.0);
final semiBoldColorTheme_20 = semiBoldColorTheme.copyWith(fontSize: 20.0);
final semiBoldColorTheme_32 = semiBoldColorTheme.copyWith(fontSize: 32.0);

final boldColorTheme =bold.copyWith(color: themeColor);
final boldColorTheme_13 = boldColorTheme.copyWith(fontSize: 13.0);
final boldColorTheme_20 = boldColorTheme.copyWith(fontSize: 20.0);


final semiBoldColorHintText =semiBold.copyWith(color: hintTextColor);
final semiBoldColorHintText_12 = semiBoldColorHintText.copyWith(fontSize: 12.0);
final semiBoldColorHintText_20 = semiBoldColorHintText.copyWith(fontSize: 20.0);



List<String> promptQuestions = [
  "Why women suffering from endometriosis are considered unsuitable for marriage ?",
  "Menopause sounds terrible .. What should I expect and how should I do?",
  "Why a woman who loses virginity before marriage considered immoral ?",
  "What should I do if I am getting irregular periods ?",
  "Why I am not allowed to enter the temple when I am on period ?",
];

List<Map<String,dynamic>> donationScreenList = [
  {
    "icon" : const Icon(Icons.medical_services_outlined,color: themeColor,),
    "text" : "Health",
  },
  {
    "icon" : const Icon(CupertinoIcons.book,color: themeColor,),
    "text" : "Education",
  },
  {
    "icon" : const Icon(Icons.water_drop,color: themeColor,),
    "text" : "Intimacy",
  },
  {
    "icon" : const Icon(CupertinoIcons.square_grid_2x2,color: themeColor,),
    "text" : "View All",
  },
];

List<Map<String,dynamic>> doctorsInfo = [
  {
    "image" : "assets/doctor1.jpg",
    "name" : "Dr. Aradhana Singh",
    "timing" : "10:00 AM to 12:00 PM"
  },
  {
    "image" : "assets/doctor1.jpg",
    "name" : " Dr. Monika Wadhwan",
    "timing" : "8:00 PM to 10:00 PM"
  },
  {
    "image" : "assets/doctor1.jpg",
    "name" : "Dr. Puja Dewan",
    "timing" : "2:00 PM to 4:00 PM"
  },
  {
    "image" : "assets/doctor1.jpg",
    "name" : "Dr. Aanchal Agarwal",
    "timing" : "6:00 PM to 8:00 PM"
  },
];