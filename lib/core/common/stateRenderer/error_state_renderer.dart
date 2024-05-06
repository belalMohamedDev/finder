import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ErrorFlowStateRender extends StatelessWidget {
  final String errorMessage;
  final int errorCode;
  final VoidCallback retryActionFunction;
  const ErrorFlowStateRender(
      {super.key,
      required this.errorCode,
      required this.errorMessage,
      required this.retryActionFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 180.h,
            width: 250.w,
            child: Lottie.asset(
              errorCode == -6 ? JsonAsset.noInternet : JsonAsset.error,
            ),
          ),
          SizedBox(
            height: errorCode == -6 ? 10.h : 5.h,
          ),
          Text(
            errorMessage,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: FontFamilyHelper.cairoArabic,
              color: ColorsLight.lightBlack,
            ),
          ),
          SizedBox(
            height: 15.h,
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
