import 'package:finder/core/application/connectivity_controller.dart';
import 'package:finder/core/common/stateRenderer/no_network_render.dart';
import 'package:finder/core/routing/app_router.dart';
import 'package:finder/core/routing/routes.dart';

import 'package:finder/core/style/theme/app_theme.dart';

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
        child: ValueListenableBuilder(
          valueListenable: ConnectivityController.instance.isConnected,
          builder: (_, value, __) {
            if (value) {
              return MaterialApp(
                builder: (context, widget) {
                  return Scaffold(
                    body: Builder(
                      builder: (context) {
                        ConnectivityController.instance.init();
                        return widget!;
                      },
                    ),
                  );
                },
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.splashRoute,
                onGenerateRoute: RouteGenerator.getRoute,
   
                theme: themeLight(),
              );
            } else {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: themeLight(),
                onGenerateRoute: RouteGenerator.getRoute,
                home: const NoNetworkView(),
              );
            }
          },
        ));
  }
}
