import 'package:finder/core/application/di.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/feature/getFoundReportsScreen/logic/cubit/get_found_cubit.dart';
import 'package:finder/feature/getFoundReportsScreen/presentation/pages/found_screen.dart';
import 'package:finder/feature/home/presentation/pages/home_screen.dart';
import 'package:finder/feature/getMissingRepotsScreen/logic/cubit/get_missing_cubit.dart';
import 'package:finder/feature/getMissingRepotsScreen/presentation/pages/missing_screen.dart';
import 'package:finder/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:finder/feature/profile/presentation/screen/profile_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int currentBottomIndex = 0;

  List<Widget> currentPage = [
    const HomeView(),
    BlocProvider(
      create: (context) => instance<GetMissingCubit>()..getMissing(),
      child: const MissingView(),
    ),
    BlocProvider(
      create: (context) => instance<GetFoundCubit>()..getFound(),
      child: const FoundView(),
    ),
    BlocProvider(
      create: (context) => instance<ProfileCubit>(),
      child: const ProfileView(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: currentPage[currentBottomIndex],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          bottom: 12.h,
        ),
        child: ColoredBox(
          color: ColorsLight.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.sp),
              bottomRight: Radius.circular(25.sp),
              topLeft: Radius.circular(10.sp),
              topRight: Radius.circular(10.sp),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: ColorsLight.blue,
              selectedIconTheme: const IconThemeData(color: ColorsLight.white),
              unselectedIconTheme: IconThemeData(color: ColorsLight.lightWhite),
              selectedItemColor: ColorsLight.white,
              unselectedItemColor: ColorsLight.lightWhite,
              currentIndex: currentBottomIndex,
              onTap: (index) {
                currentBottomIndex = index;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: LangKeys.home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.accessibility_new_rounded),
                  label: LangKeys.missing,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_search_sharp),
                  label: LangKeys.found,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded),
                  label: LangKeys.profile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
