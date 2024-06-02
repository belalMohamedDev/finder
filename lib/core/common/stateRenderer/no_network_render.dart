import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoNetworkView extends StatelessWidget {
  final VoidCallback retryActionFunction;
  const NoNetworkView({super.key, required this.retryActionFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 110.h, left: 42.w, right: 42.w),
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
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamilyHelper.cairoArabic,
                color: ColorsLight.lightBlack,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "please check your internet connection",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: FontFamilyHelper.cairoArabic,
              color: ColorsLight.lightBlack,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: retryActionFunction,
              child: const Text(LangKeys.retryAgain),
            ),
          ),
        ],
      ),
    );
  }
}
