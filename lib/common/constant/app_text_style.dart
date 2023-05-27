import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle kHeading1 =
      GoogleFonts.openSans(fontSize: 35.sp, fontWeight: FontWeight.w600);
  static TextStyle kHeading3 =
      GoogleFonts.openSans(fontSize: 28.sp, fontWeight: FontWeight.w400);
  static TextStyle kHeading4 =
      GoogleFonts.openSans(fontSize: 26.sp, fontWeight: FontWeight.bold);
  static TextStyle kHeading4Light = GoogleFonts.openSans(fontSize: 26.sp);
  static TextStyle kHeading5 =
      GoogleFonts.openSans(fontSize: 23.sp, fontWeight: FontWeight.bold);
  static TextStyle kHeading5light =
      GoogleFonts.openSans(fontSize: 23.sp, fontWeight: FontWeight.w500);
  static TextStyle kHeading6 = GoogleFonts.openSans(
      fontSize: 19.sp, fontWeight: FontWeight.w500, letterSpacing: 0.15.w);
  static TextStyle ktitleMedium = GoogleFonts.openSans(
      fontSize: 20.sp, fontWeight: FontWeight.w400, letterSpacing: 0.15.w);
  static TextStyle ktitle = GoogleFonts.openSans(
      fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: 0.15.w);
  static TextStyle ktitleLight = GoogleFonts.openSans(
      fontSize: 16.sp, fontWeight: FontWeight.w400, letterSpacing: 0.15.w);
  static TextStyle kSubtitle = GoogleFonts.openSans(
      fontSize: 15.sp, fontWeight: FontWeight.w400, letterSpacing: 0.15.w);
  static TextStyle kMediumBodyText = GoogleFonts.openSans(
      fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25.w);
  static TextStyle kSmallBodyText = GoogleFonts.openSans(
      fontSize: 12.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25.w);
  static TextStyle kBodyText = GoogleFonts.openSans(
      fontSize: 13.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25.w);
  static TextStyle kBodyText2 = GoogleFonts.openSans(
      fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25.w);
  static TextStyle kSmallText = GoogleFonts.openSans(
      fontSize: 10.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25.w);

  static TextStyle kHeading4Revert = GoogleFonts.openSans(
      fontSize: 26.sp,
      fontWeight: FontWeight.bold,
      color:
          SchedulerBinding.instance.window.platformBrightness == Brightness.dark
              ? Colors.black
              : Colors.white);
  static TextStyle kHeading5Revert = GoogleFonts.openSans(
      fontSize: 23.sp,
      fontWeight: FontWeight.bold,
      color:
          SchedulerBinding.instance.window.platformBrightness == Brightness.dark
              ? Colors.black
              : Colors.white);
  static TextStyle kHeading6Revert = GoogleFonts.openSans(
      fontSize: 19.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15.w,
      color:
          SchedulerBinding.instance.window.platformBrightness == Brightness.dark
              ? Colors.black
              : Colors.white);
  static TextStyle kSubtitleRevert = GoogleFonts.openSans(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15.w,
      color:
          SchedulerBinding.instance.window.platformBrightness == Brightness.dark
              ? Colors.black
              : Colors.white);
  static TextStyle kBodyTextRevert = GoogleFonts.openSans(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25.w,
      color:
          SchedulerBinding.instance.window.platformBrightness == Brightness.dark
              ? Colors.black
              : Colors.white);
}
