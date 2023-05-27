import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:job_thing_technical_test/common/app_enum.dart';
import 'package:job_thing_technical_test/common/constant/app_colors.dart';
import 'package:job_thing_technical_test/common/constant/app_text_style.dart';
import 'package:job_thing_technical_test/common/constant/dimens.dart';
import 'package:job_thing_technical_test/common/utils.dart';
import 'package:job_thing_technical_test/domain/entities/candidate.dart';
import 'package:job_thing_technical_test/presentarion/pages/detail/candidate/bloc/candidate_bloc.dart';
import 'package:job_thing_technical_test/presentarion/widgets/app_back_button.dart';
import 'package:job_thing_technical_test/presentarion/widgets/bouncing_button.dart';
import 'package:job_thing_technical_test/presentarion/widgets/state/error.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class DetailCandidatePage extends StatefulWidget {
  const DetailCandidatePage({Key? key, required this.item}) : super(key: key);

  final Candidate item;

  @override
  State<DetailCandidatePage> createState() => _DetailCandidatePageState();
}

class _DetailCandidatePageState extends State<DetailCandidatePage> {
  late CandidateBloc _candidateBloc;

  @override
  void initState() {
    _candidateBloc = context.read<CandidateBloc>();
    _candidateBloc.add(OnInitData(candidate: widget.item));
    _candidateBloc.add(OnFetchAllData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AppBackButton(),),
      body: BlocConsumer<CandidateBloc, CandidateState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.mainRequestState == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.mainRequestState == RequestState.Error) {
            return ErrorState(
              title: state.mainMessage,
              showAction: true,
              actionTitle: "Retry",
              action: () => _candidateBloc.add(OnFetchAllData()),
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              color: Colors.red[200],
              child: Padding(
                padding: EdgeInsets.all(DimensH.mediumMargin),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: DimensH.smallMargin,
                      vertical: DimensV.smallMargin),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                width: 100.w,
                                height: 100.w,
                                imageUrl: widget.item.photo,
                                placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                                errorWidget: (context, url, widget) =>
                                const Icon(Icons.error),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: DimensH.smallMargin),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.mainCandidate?.name ?? "",
                                      style: AppTextStyle.ktitleMedium,
                                    ),
                                    Text(
                                      state.experienceCandidate?.jobTitle ??
                                          "",
                                      style: AppTextStyle.kSmallBodyText
                                          .copyWith(
                                          color:
                                          AppColors.textGreyColor),
                                    ),
                                    Text(
                                        '${state.addressCandidate?.city} - ${state.addressCandidate?.state}',
                                        style: AppTextStyle.kSmallText)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: DimensV.smallMargin,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: DimensV.tinyMargin),
                          decoration: BoxDecoration(
                            color: AppColors.fillLightGreyColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Company',
                                    style: AppTextStyle.kSmallText.copyWith(
                                        color: AppColors.textGreyColor),
                                  ),
                                  SizedBox(
                                    height: DimensV.veryTinyMargin,
                                  ),
                                  Text(
                                      '${state.experienceCandidate?.companyName}')
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Industry',
                                    style: AppTextStyle.kSmallText.copyWith(
                                        color: AppColors.textGreyColor),
                                  ),
                                  SizedBox(
                                    height: DimensV.veryTinyMargin,
                                  ),
                                  Text(
                                      '${state.experienceCandidate?.industry}')
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Status',
                                    style: AppTextStyle.kSmallText.copyWith(
                                        color: AppColors.textGreyColor),
                                  ),
                                  SizedBox(
                                    height: DimensV.veryTinyMargin,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(
                                          DimensH.veryTinyMargin),
                                      decoration: BoxDecoration(
                                        color: state.statusColor,
                                        borderRadius:
                                        BorderRadius.circular(5.0.r),
                                      ),
                                      child: Text(
                                        '${state.experienceCandidate?.status.name}',
                                        style: AppTextStyle.kSmallBodyText
                                            .copyWith(
                                            color:
                                            AppColors.prismWhite),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: DimensV.mediumMargin,
                        ),
                        Text(
                          'Date of birth',
                          style: AppTextStyle.kSmallText
                              .copyWith(color: AppColors.textGreyColor),
                        ),
                        Text(
                          DateFormat('dd MMMM yyy').format(
                              state.mainCandidate?.birthday ??
                                  DateTime.now()),
                          style: AppTextStyle.kSmallBodyText,
                        ),
                        SizedBox(
                          height: DimensV.tinyMargin,
                        ),
                        Text(
                          'Email',
                          style: AppTextStyle.kSmallText
                              .copyWith(color: AppColors.textGreyColor),
                        ),
                        Text(
                          '${state.emailCandidate?.email}',
                          style: AppTextStyle.kSmallBodyText,
                        ),
                        SizedBox(
                          height: DimensV.tinyMargin,
                        ),
                        Text(
                          'Phone',
                          style: AppTextStyle.kSmallText
                              .copyWith(color: AppColors.textGreyColor),
                        ),
                        Text(
                          '${state.emailCandidate?.phone}',
                          style: AppTextStyle.kSmallBodyText,
                        ),
                        SizedBox(
                          height: DimensV.tinyMargin,
                        ),
                        Text(
                          'Address',
                          style: AppTextStyle.kSmallText
                              .copyWith(color: AppColors.textGreyColor),
                        ),
                        Text(
                          '${state.addressCandidate?.address}',
                          style: AppTextStyle.kSmallBodyText,
                        ),
                        SizedBox(
                          height: DimensV.tinyMargin,
                        ),
                        Text(
                          'Zip code',
                          style: AppTextStyle.kSmallText
                              .copyWith(color: AppColors.textGreyColor),
                        ),
                        Text(
                          '${state.addressCandidate?.zipCode}',
                          style: AppTextStyle.kSmallBodyText,
                        ),
                        SizedBox(
                          height: DimensV.bigMargin,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BouncingButton(
                              callback: () async =>
                              await Utils.sendMessageToWhatsApp(
                                  "${state.emailCandidate?.phone}",
                                  "Hi i am MK company"),
                              content: const FaIcon(
                                FontAwesomeIcons.whatsapp,
                                color: AppColors.prismWhite,
                              ),
                              bgColor: AppColors.prismGreen_60,
                              minimumWidth: 50.w,
                            ),
                            SizedBox(
                              width: DimensH.smallMargin,
                            ),
                            BouncingButton(
                              callback: () => launchUrl(Uri.parse(
                                  "mailto:${state.emailCandidate?.email}?body=Hi%20i%20am%20MK%20company")),
                              content: const FaIcon(
                                FontAwesomeIcons.envelope,
                                color: AppColors.prismWhite,
                              ),
                              bgColor: AppColors.prismBlue_40,
                              minimumWidth: 50.w,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
