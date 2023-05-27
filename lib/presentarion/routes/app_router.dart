import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:job_thing_technical_test/domain/entities/blog.dart';
import 'package:job_thing_technical_test/domain/entities/candidate.dart';
import 'package:job_thing_technical_test/presentarion/pages/detail/candidate/detail_blog_page.dart';
import 'package:job_thing_technical_test/presentarion/pages/detail/detail_candidate_page.dart';
import 'package:job_thing_technical_test/presentarion/pages/home/home_page.dart';
import 'package:job_thing_technical_test/presentarion/pages/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: DetailCandidateRoute.page,
        ),
        AutoRoute(
          page: DetailBlogRoute.page,
        ),
      ];
}
