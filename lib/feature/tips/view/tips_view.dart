import 'package:finder/core/language/lang_keys.dart';

import 'package:finder/core/style/fonts/font_family_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipsView extends StatelessWidget {
  const TipsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LangKeys.tips,
          style: TextStyle(
              fontSize: 15.sp,
              fontFamily: FontFamilyHelper.cairoArabic,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 70.h, left: 28.w, right: 25.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                LangKeys.tips1,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                LangKeys.tips2,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                LangKeys.tips3,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                LangKeys.tips4,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                LangKeys.tips5,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                LangKeys.tips6,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                LangKeys.tops7,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                LangKeys.tips8,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
