import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoNetworkView extends StatelessWidget {
  const NoNetworkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(bottom: 100.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                height: 190.h,
                width: 310.w,
                child: Image.asset("asset/images/cloud.gif")),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              "Oops !",
              style: TextStyle(
                  fontSize: 35.sp,
                  fontFamily: FontFamilyHelper.cairoArabic,
                  color: ColorsLight.blue,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              "There is no internet connection",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamilyHelper.cairoArabic,
                color: ColorsLight.lightBlack,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              "please check your internet connection",
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: FontFamilyHelper.cairoArabic,
                color: ColorsLight.lightBlack,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
