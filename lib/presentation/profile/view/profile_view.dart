
import 'package:finder/presentation/resources/color_manger.dart';
import 'package:finder/presentation/resources/font_manger.dart';
import 'package:finder/presentation/resources/route_manger.dart';
import 'package:finder/presentation/resources/strings_manger.dart';
import 'package:finder/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../application/app_prefs.dart';
import '../../../application/di.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
              top: AppPadding.p1.h,
              left: AppPadding.p5.w,
              right: AppPadding.p5.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: AppPadding.p76.w,
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      size: AppPadding.p22.sp,
                      color: ColorManger.lightGrey,
                    )),
              ),
              _stack(),
              SizedBox(
                height: AppPadding.p4.h,
              ),
              _column()
            ],
          ),
        ),
      )),
    );
  }

  Widget _column() {
    return Column(
      children: [
        Card(
          color: ColorManger.lightWhiteColor,
          elevation: APPSize.s5.sp,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(APPSize.s8.sp),
            ),
          ),
          child: Container(
            height: AppPadding.p7.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(APPSize.s8.sp),
                ),
                border: Border.all(
                  color: ColorManger.lightBlueDegree,
                )),
            child: Row(children: [
              SizedBox(
                width: AppPadding.p3.w,
              ),
              Icon(
                Icons.lightbulb,
                color: ColorManger.lightYellow,
              ),
              SizedBox(
                width: AppPadding.p3.w,
              ),
              const Text(AppStrings.tips)
            ]),
          ),
        ),
        SizedBox(
          height: AppPadding.p1.h,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.aboutApp);
          },
          child: Card(
            color: ColorManger.lightWhiteColor,
            elevation: APPSize.s5.sp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(APPSize.s8.sp),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(APPSize.s8.sp),
                  ),
                  border: Border.all(
                    color: ColorManger.lightBlueDegree,
                  )),
              height: AppPadding.p7.h,
              width: double.infinity,
              child: Row(children: [
                SizedBox(
                  width: AppPadding.p3.w,
                ),
                const Icon(Icons.error_outline_rounded),
                SizedBox(
                  width: AppPadding.p3.w,
                ),
                const Text(AppStrings.about)
              ]),
            ),
          ),
        ),
        SizedBox(
          height: AppPadding.p1.h,
        ),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(APPSize.s12.sp)),
                    side: BorderSide(
                        color: ColorManger.white, width: AppPadding.p1.sp)),
                backgroundColor: ColorManger.blue1,
                titleTextStyle: TextStyle(
                    color: ColorManger.white,
                    fontSize: FontSize.s16.sp,
                    fontWeight: FontWeight.bold),
                title: const Text(AppStrings.logOutSure),
                actions: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(APPSize.s15.sp),
                        border: Border.all(
                            color: ColorManger.white, width: AppPadding.p1.sp)),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: FontSize.s15.sp,
                            color: ColorManger.white),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      _appPreferences.removeData();
                      Navigator.pushReplacementNamed(context, Routes.loginRoute);
                    },
                    child: Text(
                      "yes",
                      style: TextStyle(
                          fontSize: FontSize.s15.sp, color: ColorManger.white),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Card(
            color: ColorManger.lightWhiteColor,
            elevation: APPSize.s5.sp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(APPSize.s8.sp),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(APPSize.s8.sp),
                  ),
                  border: Border.all(
                    color: ColorManger.lightBlueDegree,
                  )),
              height: AppPadding.p7.h,
              width: double.infinity,
              child: Row(children: [
                SizedBox(
                  width: AppPadding.p3.w,
                ),
                const Icon(Icons.add_to_home_screen_sharp),
                SizedBox(
                  width: AppPadding.p3.w,
                ),
                const Text(AppStrings.logOut)
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _stack() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppPadding.p10.h),
          child: Card(
            color: ColorManger.lightDarkBlue,
            elevation: APPSize.s3.sp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(APPSize.s15.sp),
              ),
            ),
            child: SizedBox(
              height: AppPadding.p35.h,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: AppPadding.p6.h,
                  ),
                  Text(
                    "     Name:  ${_appPreferences.isAccessName()}  ",
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                  ),
                  Text(
                    '     Phone Number:  ${_appPreferences.isAccessPhoneNumber()}   ',
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                  ),
                  Text(
                    "     National Number:  ${_appPreferences.isAccessNationalId()}  ",
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                  ),
                  Text(
                    "     Address:  ${_appPreferences.isAccessAddress()}  ",
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: AppPadding.p3.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              height: AppPadding.p18.h,
              width: AppPadding.p41.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(_appPreferences.isAccessImage()),
                    fit: BoxFit.cover,
                ),
                color: ColorManger.lightDarkBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(APPSize.s60.sp),
                ),

              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: AppPadding.p41.h,
          ),
          child: Center(
              child: ElevatedButton(
            child: Text(
              AppStrings.edite,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(primary: ColorManger.blue),
          )),
        ),
      ],
    );
  }
}
