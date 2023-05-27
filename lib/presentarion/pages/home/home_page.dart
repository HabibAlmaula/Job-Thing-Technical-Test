import 'package:auto_route/annotations.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_thing_technical_test/common/app_enum.dart';
import 'package:job_thing_technical_test/common/constant/app_colors.dart';
import 'package:job_thing_technical_test/common/constant/app_text_style.dart';
import 'package:job_thing_technical_test/domain/entities/blog.dart';
import 'package:job_thing_technical_test/domain/entities/candidate.dart';
import 'package:job_thing_technical_test/presentarion/pages/home/bloc/home_bloc.dart';
import 'package:job_thing_technical_test/presentarion/widgets/blog_item.dart';
import 'package:job_thing_technical_test/presentarion/widgets/candidate_item.dart';
import 'package:job_thing_technical_test/presentarion/widgets/custom_form_field.dart';
import 'package:job_thing_technical_test/presentarion/widgets/state/empty.dart';
import 'package:job_thing_technical_test/presentarion/widgets/state/error.dart';
import 'package:logger/logger.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;
  final searchController = TextEditingController();

  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    _homeBloc.add(OnFetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.candidatesRequestState == RequestState.Error) {
            Logger().i(state.candidatesMessage);
            BotToast.showSimpleNotification(
                title: state.candidatesMessage,
                titleStyle: AppTextStyle.kSmallBodyText
                    .copyWith(color: AppColors.prismWhite),
                backgroundColor: AppColors.prismRed_40,
                onlyOne: true);
          }
        },
        builder: (context, state) {
          var dataList = state.mixedData.where((item) {
            if (item is Blog) {
              // Filter by blog title
              return item.title
                  .toLowerCase()
                  .contains(state.searchQuery.toLowerCase());
            } else if (item is Candidate) {
              // Filter by candidate name
              return item.name
                  .toLowerCase()
                  .contains(state.searchQuery.toLowerCase());
            }
            return false;
          }).toList();
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 75.h,
                flexibleSpace: FlexibleSpaceBar(
                  background: SafeArea(
                    child: Column(
                      children: [
                        CustomFormField(
                          //disable search when error
                          isEnable: (state.blogsRequestState== RequestState.Error || state.candidatesRequestState == RequestState.Error) ? false: true,
                          hintText: "Search candidate's name and blog's title",
                          prefix: Icon(
                            Icons.search,
                            size: 25.w,
                          ),
                          maxLines: 1,
                          enablePaddingOutside: true,
                          controller: searchController,
                          isRemovable: true,
                          onChange: (query) =>
                              _homeBloc.add(OnSearchData(query: query)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state.candidatesRequestState == RequestState.Loading ||
                  state.blogsRequestState == RequestState.Loading)
                const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              if (state.candidatesRequestState == RequestState.Loaded &&
                  state.blogsRequestState == RequestState.Loaded &&
                  dataList.isNotEmpty)
                SliverFillRemaining(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      _homeBloc.add(OnFetchData());
                    },
                    child: ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        final data =dataList[index];

                        if (data is Candidate) {
                          return CandidateItem(item: data);
                        } else {
                          return BlogItem(item: data);
                        }
                      },
                    ),
                  ),
                ),
              if (state.candidatesRequestState == RequestState.Loaded &&
                  state.blogsRequestState == RequestState.Loaded &&
                  dataList.isEmpty)
                const SliverFillRemaining(
                    hasScrollBody: false,
                    child: EmptyState(
                      title: 'Data not found',
                    )),
              if (state.candidatesRequestState == RequestState.Error &&
                  state.blogsRequestState == RequestState.Error)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: ErrorState(
                    title: state.candidatesMessage,
                    showAction: true,
                    action: () => _homeBloc.add(OnFetchData()),
                    actionTitle: "Retry",
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
