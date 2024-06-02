// import 'package:finder/core/routing/app_router.dart';
// import 'package:finder/core/routing/routes.dart';

import 'package:finder/core/style/theme/app_theme.dart';
import 'package:finder/feature/test/test.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  //factory
  factory MyApp() => _instance;
  //singleton or single _instance

  const MyApp._internal(); //privet named constructor

  static const MyApp _instance = MyApp._internal();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const TestWeidget(),
          // initialRoute: Routes.splashRoute,
          //onGenerateRoute: RouteGenerator.getRoute,
          theme: themeLight(),
        ));
  }
}
