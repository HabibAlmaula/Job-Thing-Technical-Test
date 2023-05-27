import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
// text style
  static final TextStyle kHeading5 =
      GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
  static final TextStyle kHeading6 = GoogleFonts.poppins(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
  static final TextStyle kSubtitle = GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
  static final TextStyle kBodyText = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

  static TextStyle kHeading1 =
      GoogleFonts.openSans(fontSize: 35.sp, fontWeight: FontWeight.w600);
  static TextStyle kHeading3 =
      GoogleFonts.openSans(fontSize: 28.sp, fontWeight: FontWeight.w400);
  static TextStyle kHeading4 =
      GoogleFonts.openSans(fontSize: 26.sp, fontWeight: FontWeight.bold);
  static TextStyle kHeading4Light = GoogleFonts.openSans(fontSize: 26.sp);
  static TextStyle kHeading5light =
      GoogleFonts.openSans(fontSize: 23.sp, fontWeight: FontWeight.w500);
  static TextStyle ktitleMedium = GoogleFonts.openSans(
      fontSize: 20.sp, fontWeight: FontWeight.w400, letterSpacing: 0.15.w);
  static TextStyle ktitle = GoogleFonts.openSans(
      fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: 0.15.w);
  static TextStyle ktitleLight = GoogleFonts.openSans(
      fontSize: 16.sp, fontWeight: FontWeight.w400, letterSpacing: 0.15.w);
  static TextStyle kMediumBodyText = GoogleFonts.openSans(
      fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25.w);
  static TextStyle kSmallBodyText = GoogleFonts.openSans(
      fontSize: 12.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25.w);
  static TextStyle kBodyText2 = GoogleFonts.openSans(
      fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25.w);
  static TextStyle kSmallText = GoogleFonts.openSans(
      fontSize: 10.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25.w);
}
