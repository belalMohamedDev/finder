import 'package:finder/presentation/found/view/found_view.dart';
import 'package:finder/presentation/missing/view/missing_view.dart';
import 'package:finder/presentation/profile/view/profile_view.dart';
import 'package:finder/presentation/resources/color_manger.dart';
import 'package:finder/presentation/resources/strings_manger.dart';
import 'package:finder/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../home/view/home_view.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int currentBottomIndex = 0;

  List currentPage = [
    const HomeView(),
    const MissingView(),
    const FoundView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: currentPage[currentBottomIndex]),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: AppPadding.p5.w,
            right: AppPadding.p5.w,
            bottom: AppPadding.p2.h),
        child: Container(
          color: ColorManger.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(APPSize.s18.sp),
                bottomRight: Radius.circular(APPSize.s18.sp),
                topLeft: Radius.circular(APPSize.s8.sp),
                topRight: Radius.circular(APPSize.s6.sp)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: ColorManger.blue,
              selectedIconTheme: IconThemeData(color: ColorManger.white),
              unselectedIconTheme: IconThemeData(color: ColorManger.lightWhite),
              selectedItemColor: ColorManger.white,
              unselectedItemColor: ColorManger.lightWhite,
              currentIndex: currentBottomIndex,
              onTap: (index) {
                currentBottomIndex = index;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: AppStrings.home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.accessibility_new_rounded),
                  label: AppStrings.missing,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_search_sharp),
                  label: AppStrings.found,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded),
                  label: AppStrings.profile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
