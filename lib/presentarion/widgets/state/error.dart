import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_thing_technical_test/common/constant/app_colors.dart';
import 'package:job_thing_technical_test/common/constant/app_text_style.dart';
import 'package:job_thing_technical_test/common/constant/dimens.dart';
import 'package:job_thing_technical_test/presentarion/widgets/bouncing_button.dart';
import 'package:lottie/lottie.dart';

class ErrorState extends StatelessWidget {
  const ErrorState(
      {Key? key,
      this.action,
      this.showAction = false,
      this.actionTitle,
      required this.title})
      : super(key: key);
  final VoidCallback? action;
  final bool? showAction;
  final String title;
  final String? actionTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/raw/error_animation.json',
            width: 200.w,
            height: 200.h,
          ),
          Text(
            title,
            style: AppTextStyle.kSmallBodyText,
          ),
          SizedBox(
            height: DimensV.smallMargin,
          ),
          if (showAction == true)
            BouncingButton(
              callback: action!,
              content: Text(
                actionTitle ?? "",
                style: AppTextStyle.kSmallBodyText
                    .copyWith(color: AppColors.prismWhite),
              ),
              minimumWidth: 100.w,
              minimumHeight: 30.h,
              bgColor: AppColors.prismBlue_60,
            )
        ],
      ),
    );
  }
}
