import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:job_thing_technical_test/common/constant/app_colors.dart';
import 'package:job_thing_technical_test/common/constant/app_text_style.dart';
import 'package:job_thing_technical_test/common/constant/dimens.dart';
import 'package:job_thing_technical_test/domain/entities/candidate.dart';
import 'package:job_thing_technical_test/presentarion/routes/app_router.dart';

class CandidateItem extends StatelessWidget {
  const CandidateItem({Key? key, required this.item}) : super(key: key);

  final Candidate item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DimensH.mediumMargin,
        vertical: DimensV.tinyMargin,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey[200]),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: () => context.pushRoute(DetailCandidateRoute(item: item)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 100.h,
                    width: 75.w,
                    imageUrl: item.photo,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: DimensV.smallMargin, horizontal: DimensH.smallMargin),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name, style: AppTextStyle.ktitle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    DateFormat('dd MMMM yyyy').format(item.birthday), style: AppTextStyle.kSmallText,),
                                Text(
                                  DateFormat('dd MMMM yyyy').format(item.expired),
                                  style: AppTextStyle.kSmallText.copyWith(color: AppColors.prismRed_40),
                                )
                              ],
                            ),
                            ImageIcon(
                              (item.gender == 'm')
                                  ? const AssetImage('assets/icons/male.png')
                                  : const AssetImage('assets/icons/female.png'),
                              size: DimensH.mediumMargin,
                              color: (item.gender =='m') ? AppColors.prismBlue_60 : AppColors.prismRed_50,
                            )
                          ],
                        )
                      ],
                    ),
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
