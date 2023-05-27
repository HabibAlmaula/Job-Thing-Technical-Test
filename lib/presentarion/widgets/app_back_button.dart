import 'package:flutter/material.dart';
import 'package:job_thing_technical_test/common/constant/dimens.dart';

class AppBackButton extends StatelessWidget {
  AppBackButton({Key? key, this.onTap, this.colors}) : super(key: key);
  final Color? colors;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
              () {
            Navigator.of(context).pop();
          },
      child: Container(
        width: DimensH.mediumLargeMargin,
        height: DimensV.mediumLargeMargin,
        padding: EdgeInsets.symmetric(horizontal: DimensH.mediumMargin),
        child: ImageIcon(
          const AssetImage('assets/icons/back.png'),
          size: DimensV.smallMargin,
          color: colors ??
              (Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black),
        ),
      ),
    );
  }
}