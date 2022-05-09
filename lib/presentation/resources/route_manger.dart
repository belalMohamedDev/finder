import 'package:finder/presentation/home/view/home_view.dart';
import 'package:finder/presentation/profile/aboutApp/view/about_app_view.dart';
import 'package:finder/presentation/register/view/register_view.dart';

import 'package:finder/presentation/resources/strings_manger.dart';
import 'package:flutter/material.dart';

import '../../application/di.dart';
import '../bottomNavBar/view/bottom_nav_bar_view.dart';
import '../login/view/login_view.dart';
import '../onBoarding/view/onBoarding_view.dart';
import '../splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/"; //main routes
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String bottomNavBarRoute = "/bottomNavBar";
  static const String aboutApp = "/aboutApp";
  static const String home = "/home";
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
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );
        case Routes.bottomNavBarRoute:
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
