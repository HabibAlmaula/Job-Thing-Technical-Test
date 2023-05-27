import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_thing_technical_test/common/constant/text_style.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/raw/empty_animation.json',
            width: 175.w,
            height: 200.h,
          ),
          if (title != null)
            Text(
              title ?? "",
              style: AppTextStyle.kSubtitle,
            )
        ],
      ),
    );
  }
}
