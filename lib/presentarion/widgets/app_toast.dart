// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/route_manager.dart';
// import 'package:job_thing_technical_test/common/constant/app_colors.dart';
//
// class AppToast{
//   static showSuccesToast(String message) {
//     Get.showSnackbar(GetSnackBar(
//       backgroundColor: AppColors.successFillColor,
//       messageText: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
//             child: Icon(Icons.check_circle,
//                 color: AppColors.successColor, size: 32.w),
//           ),
//           Expanded(
//               child: Text(message,
//                   style: TextStyle(color: AppColors.successTextColor)))
//         ],
//       ),
//       duration: const Duration(seconds: 2),
//       snackPosition: SnackPosition.TOP,
//       snackStyle: SnackStyle.FLOATING,
//       borderRadius: 15.r,
//       margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//       barBlur: 7.0,
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.0.h),
//       forwardAnimationCurve: Curves.easeOutSine,
//       reverseAnimationCurve: Curves.easeInSine,
//       animationDuration: const Duration(seconds: 1),
//       overlayBlur: 0.0,
//       overlayColor: Colors.transparent,
//     ));
//   }
//
//   static showErrorToast(String message, {int? duration}) {
//     Get.showSnackbar(GetSnackBar(
//       backgroundColor: AppColors.failedFillColor,
//       messageText: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
//             child: Icon(Icons.highlight_remove_rounded,
//                 color: AppColors.failedTextColor, size: 32.w),
//           ),
//           Expanded(
//               child: Text(message,
//                   style: TextStyle(color: AppColors.failedTextColor)))
//         ],
//       ),
//       duration: Duration(seconds: duration ?? 2),
//       snackPosition: SnackPosition.TOP,
//       snackStyle: SnackStyle.FLOATING,
//       borderRadius: 15.r,
//       margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//       barBlur: 7.0,
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.0.h),
//       forwardAnimationCurve: Curves.easeOutSine,
//       reverseAnimationCurve: Curves.easeInSine,
//       animationDuration: const Duration(seconds: 1),
//       overlayBlur: 0.0,
//       overlayColor: Colors.transparent,
//     ));
//   }
// }