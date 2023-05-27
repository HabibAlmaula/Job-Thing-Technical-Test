import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_thing_technical_test/bloc_observer.dart';
import 'package:job_thing_technical_test/presentarion/pages/detail/candidate/bloc/candidate_bloc.dart';
import 'package:job_thing_technical_test/presentarion/pages/home/bloc/home_bloc.dart';
import 'package:job_thing_technical_test/presentarion/routes/app_router.dart';
import 'package:job_thing_technical_test/presentarion/routes/app_router_observer.dart';
import 'package:job_thing_technical_test/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await di.locator.allReady();
  Bloc.observer = MainBlocObserver();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();
  final navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => di.locator<HomeBloc>()),
            BlocProvider(create: (_) => di.locator<CandidateBloc>()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(
                navigatorObservers: () => [AppRouterObserver(), BotToastNavigatorObserver()]),
            builder: BotToastInit(),
            theme: ThemeData(
              primaryColor: Colors.black,
              primaryColorLight: Colors.black,
              textTheme: Typography.englishLike2018.apply(
                  fontSizeFactor: 1.sp,
                  bodyColor: Colors.black,
                  displayColor: Colors.black),
              dividerColor: Colors.grey,
              fontFamily: GoogleFonts.openSans().fontFamily,
              brightness: Brightness.light,
              indicatorColor: Colors.black,
              tabBarTheme: const TabBarTheme(labelColor: Colors.black),
              // Add scaffold background color
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                ),
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                elevation: 2.5,
              ),
            ),
          ),
        );
      },
    );
  }
}
