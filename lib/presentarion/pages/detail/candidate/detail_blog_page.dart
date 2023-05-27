import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_thing_technical_test/common/constant/app_text_style.dart';
import 'package:job_thing_technical_test/common/constant/dimens.dart';
import 'package:job_thing_technical_test/domain/entities/blog.dart';
import 'package:intl/intl.dart';
import 'package:job_thing_technical_test/presentarion/widgets/app_back_button.dart';

@RoutePage()
class DetailBlogPage extends StatefulWidget {
  const DetailBlogPage({Key? key, required this.item}) : super(key: key);

  final Blog item;

  @override
  State<DetailBlogPage> createState() => _DetailBlogPageState();
}

class _DetailBlogPageState extends State<DetailBlogPage> {
  late ScrollController _scrollController;
  Color _textColor = Colors.white;
  static const kExpandedHeight = 200.0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.black;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            // show and hide SliverAppBar Title
            title: _isSliverAppBarExpanded
                ? Text(
                    widget.item.title,
                    style: TextStyle(color: _textColor),
                  )
                : null,
            pinned: true,
            snap: false,
            floating: false,
            leading: AppBackButton(),
            expandedHeight: kExpandedHeight,
            // show and hide FlexibleSpaceBar title
            flexibleSpace: _isSliverAppBarExpanded
                ? null
                : FlexibleSpaceBar(
                    background: CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.fill,
                      imageUrl: widget.item.photo,
                      placeholder: (context, url) => SizedBox(
                          height: 50.w,
                          width: 50.w,
                          child: const CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/icons/placeholder.png',
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: DimensH.mediumMargin),
              child: Column(
                children: [
                  Text(
                    widget.item.title,
                    style: AppTextStyle.kHeading6,
                  ),
                  SizedBox(
                    height: DimensV.mediumMargin,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('dd MMMM yyyy')
                                  .format(widget.item.createAt),
                              style: AppTextStyle.kSmallText,
                            ),
                            Text(
                              widget.item.author,
                              style: AppTextStyle.kSmallBodyText
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: List.generate(
                          widget.item.tag.length,
                          (index) => Container(
                            margin: EdgeInsets.only(right: 3.w),
                            padding: EdgeInsets.symmetric(
                                vertical: DimensH.tinyMargin,
                                horizontal: DimensH.smallMargin),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.grey[200]),
                            child: Text(
                              widget.item.tag[index],
                              style: AppTextStyle.kSmallText,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: DimensV.largeMargin,
                  ),
                  Text(
                    widget.item.content,
                    style: AppTextStyle.kBodyText2,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
