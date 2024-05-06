import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              height: 80.h,
              width: 85.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120.sp),
                  color: ColorsLight.lightBlue1,
                  image: const DecorationImage(
                      image: AssetImage(
                    ImageAsset.logo,
                  )))),
          SizedBox(
            height: 35.h,
          ),
          Text(
            LangKeys.aboutTheApp,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 23.sp,
                fontFamily: FontFamilyHelper.cairoArabic),
          ),
          SizedBox(
            height: 35.h,
          ),
          const ColumnText(),
          const Spacer(),
          const NavBarBottomStack(),
        ],
      ),
    );
  }
}

class ColumnText extends StatelessWidget {
  const ColumnText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          LangKeys.aboutTheAppText1,
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w300,
              fontSize: 18.sp,
              fontFamily: FontFamilyHelper.cairoArabic),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          LangKeys.aboutTheAppText2,
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w300,
              fontSize: 18.sp,
              fontFamily: FontFamilyHelper.cairoArabic),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          LangKeys.aboutTheAppText3,
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w300,
              fontSize: 18.sp,
              fontFamily: FontFamilyHelper.cairoArabic),
        ),
      ],
    );
  }
}

class NavBarBottomStack extends StatelessWidget {
  const NavBarBottomStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [

      Padding(
        padding: EdgeInsets.only(top: 28.h),
        child: Container(
          height: 50.h,
          width: double.infinity,
          color: ColorsLight.white,
        ),
      ),
      Center(
        child: SizedBox(
          height: 50.h,
          width: 55.w,
          child: FloatingActionButton(
            backgroundColor: ColorsLight.blueD8,
            elevation: 10,
            onPressed: (() {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.bottomNavBarRoute, (route) => false);
            }),
            child: Icon(
              Icons.home,
              color: ColorsLight.lightWhiteColor,
              size: 20.sp,
            ),
          ),
        ),
      ),
    ]);
  }
}
