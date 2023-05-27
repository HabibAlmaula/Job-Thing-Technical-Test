// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailBlogRoute.name: (routeData) {
      final args = routeData.argsAs<DetailBlogRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailBlogPage(
          key: args.key,
          item: args.item,
        ),
      );
    },
    DetailCandidateRoute.name: (routeData) {
      final args = routeData.argsAs<DetailCandidateRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailCandidatePage(
          key: args.key,
          item: args.item,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [DetailBlogPage]
class DetailBlogRoute extends PageRouteInfo<DetailBlogRouteArgs> {
  DetailBlogRoute({
    Key? key,
    required Blog item,
    List<PageRouteInfo>? children,
  }) : super(
          DetailBlogRoute.name,
          args: DetailBlogRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailBlogRoute';

  static const PageInfo<DetailBlogRouteArgs> page =
      PageInfo<DetailBlogRouteArgs>(name);
}

class DetailBlogRouteArgs {
  const DetailBlogRouteArgs({
    this.key,
    required this.item,
  });

  final Key? key;

  final Blog item;

  @override
  String toString() {
    return 'DetailBlogRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [DetailCandidatePage]
class DetailCandidateRoute extends PageRouteInfo<DetailCandidateRouteArgs> {
  DetailCandidateRoute({
    Key? key,
    required Candidate item,
    List<PageRouteInfo>? children,
  }) : super(
          DetailCandidateRoute.name,
          args: DetailCandidateRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailCandidateRoute';

  static const PageInfo<DetailCandidateRouteArgs> page =
      PageInfo<DetailCandidateRouteArgs>(name);
}

class DetailCandidateRouteArgs {
  const DetailCandidateRouteArgs({
    this.key,
    required this.item,
  });

  final Key? key;

  final Candidate item;

  @override
  String toString() {
    return 'DetailCandidateRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
