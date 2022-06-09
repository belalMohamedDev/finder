import 'package:finder/presentation/home/view/home_view.dart';
import 'package:finder/presentation/makingReport/view/view.dart';
import 'package:finder/presentation/profile/aboutApp/view/about_app_view.dart';
import 'package:finder/presentation/register/view/register_view.dart';
import 'package:finder/presentation/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import '../../application/di.dart';
import '../bottomNavBar/view/bottom_nav_bar_view.dart';
import '../login/view/login_view.dart';
import '../makeUnReport/view/view.dart';
import '../onBoarding/view/onBoarding_view.dart';
import '../profile/specific/view/view.dart';
import '../profile/specificReport/view/view.dart';
import '../profile/specificUnReport/view/view.dart';
import '../splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/"; //main routes
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String bottomNavBarRoute = "/bottomNavBar";
  static const String aboutApp = "/aboutApp";
  static const String home = "/home";
  static const String makeReport = "/makeReport";
  static const String makeUnReport = "/makeUnReport";
  static const String makeSpecificReport = "/makeSpecificReport";
  static const String makeUnSpecificReport = "/makeUnSpecificReport";
  static const String specificView = "/specificView";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );
        case Routes.bottomNavBarRoute:
          initLogOutModule();
          initMissingModule();
          initFoundModule();

          initUpdateUserModule();
        return MaterialPageRoute(
          builder: (_) => const BottomNavBarView(),
        );
        case Routes.aboutApp:
        return MaterialPageRoute(
          builder: (_) => const AboutAppView(),
        );
         case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.makeReport:
        initMakeReportModule();
        return MaterialPageRoute(
          builder: (_) => const MakeReportView(),
        );
      case Routes.makeUnReport:
        initMakeUnReportModule();
        return MaterialPageRoute(
          builder: (_) => const MakeUnReportView(),
        );
      case Routes.makeSpecificReport:
       // initSpecificReportModule();
        return MaterialPageRoute(
          builder: (_) => const SpecificReportView(),
        );
      case Routes.makeUnSpecificReport:
      // initSpecificReportModule();
        return MaterialPageRoute(
          builder: (_) => const SpecificUnReportView(),
        );

      case Routes.specificView:
      // initSpecificReportModule();
        return MaterialPageRoute(
          builder: (_) => const SpecificView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
        body: const SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(child: Text(AppStrings.noRouteFound)),
        ),
      ),
    );
  }
}
