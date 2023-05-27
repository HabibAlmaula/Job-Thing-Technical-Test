import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_thing_technical_test/common/constant/dimens.dart';
import 'package:job_thing_technical_test/common/constant/text_style.dart';
import 'package:job_thing_technical_test/domain/entities/blog.dart';
import 'package:job_thing_technical_test/presentarion/routes/app_router.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({Key? key, required this.item}) : super(key: key);

  final Blog item;

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
          color: Colors.grey[200],
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => context.pushRoute(DetailBlogRoute(item: item)),
            borderRadius: BorderRadius.circular(10.r),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    height: 150.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: item.photo,
                    placeholder: (context, url) => SizedBox(
                        height: 50.w,
                        width: 50.w,
                        child: const CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/icons/placeholder.png',
                      fit: BoxFit.cover,
                      height: 150.h,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(DimensH.smallMargin),
                  child: Text(
                    item.title,
                    style: AppTextStyle.kHeading6,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(DimensH.smallMargin),
                  child: Text(
                    item.subTitle,
                    style: AppTextStyle.kSubtitle,
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
