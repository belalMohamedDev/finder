import 'package:finder/core/application/di.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/feature/aboutApp/view/about_app_view.dart';
import 'package:finder/feature/aiScreen/logic/cubit/ai_cubit.dart';
import 'package:finder/feature/aiScreen/presentation/pages/view.dart';
import 'package:finder/feature/bottomNavBar/bottom_nav_bar_view.dart';
import 'package:finder/feature/home/presentation/pages/home_screen.dart';
import 'package:finder/feature/login/presentation/screen/login_view.dart';
import 'package:finder/feature/login/logic/viewModel/login_cubit.dart';
import 'package:finder/feature/makeAObjectReport/logic/cubit/make_a_object_report_cubit.dart';
import 'package:finder/feature/makeAObjectReport/presentation/pages/view.dart';
import 'package:finder/feature/makeAPersonReport/logic/cubit/make_a_report_cubit.dart';
import 'package:finder/feature/makeAPersonReport/presentation/pages/view.dart';
import 'package:finder/feature/makeUnReport/presentation/pages/view.dart';
import 'package:finder/feature/makeUnReport/logic/viewModel/make_un_report_cubit.dart';
import 'package:finder/feature/notifications/logic/cubit/notification_cubit.dart';
import 'package:finder/feature/notifications/presentation/screen/notifications_screen.dart';

import 'package:finder/feature/onBoarding/presentation/screen/on_boarding_view.dart';

import 'package:finder/feature/signUp/presentation/screen/sign_up_view.dart';
import 'package:finder/feature/signUp/logic/viewModel/register_cubit.dart';
import 'package:finder/feature/splash/presentation/screen/splash_view.dart';
import 'package:finder/feature/tips/view/tips_view.dart';
import 'package:finder/feature/updatePassword/logic/cubit/update_password_cubit.dart';
import 'package:finder/feature/updatePassword/presentation/screen/update_password_screen.dart';
import 'package:finder/feature/updateUserData/logic/cubit/update_user_data_cubit.dart';
import 'package:finder/feature/updateUserData/presentation/screen/update_user_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<LoginCubit>(),
            child: const LoginView(),
          ),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<RegisterCubit>(),
            child: const SignUpView(),
          ),
        );
      case Routes.bottomNavBarRoute:
 

        return MaterialPageRoute(
          builder: (_) => const BottomNavBarView(),
        );

      case Routes.notificationsView:

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                instance<NotificationCubit>()..getNotifications(),
            child: const NotificationScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );

      case Routes.makeReport:

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<MakeAReportCubit>(),
            child: const MakeReportView(),
          ),
        );
      case Routes.makeUnReport:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<MakeUnReportCubit>(),
            child: const MakeUnReportView(),
          ),
        );

      case Routes.updatePasswordView:

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<UpdatePasswordCubit>(),
            child: const UpdatePasswordView(),
          ),
        );

      case Routes.updateUserDataView:

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<UpdateMyDataCubit>()..start(),
            child: const UpdateUserDataView(),
          ),
        );

      case Routes.aboutApp:
        return MaterialPageRoute(
          builder: (_) => const AboutAppView(),
        );

      case Routes.tipsView:
        return MaterialPageRoute(
          builder: (_) => const TipsView(),
        );

      case Routes.makeObjectReport:

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<MakeAObjectReportCubit>(),
            child: const MakeReportObjectView(),
          ),
        );
      case Routes.aiView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<AiCubit>(),
            child: const AiView(),
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: SizedBox.expand(
          child: Center(child: Text(LangKeys.noRouteFound)),
        ),
      ),
    );
  }
}
