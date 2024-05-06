
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,

    appBarTheme: const AppBarTheme(
      color: ColorsLight.mainColor,
    ),
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsLight.black,
        fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorsLight.white,
        fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      ),
    ),





//elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorsLight.white,
        backgroundColor: ColorsLight.darkBlue,
        textStyle: TextStyle(
          fontSize: 13.sp,
          fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
          color: ColorsLight.darkBlue,
        ),
        disabledForegroundColor: ColorsLight.darkBlue.withOpacity(0.38),
        disabledBackgroundColor: ColorsLight.darkBlue.withOpacity(0.12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.sp),
        ),
        fixedSize: Size.fromHeight(35.h),
      ),
    ),

      /// input decoration theme ( text form field )
      inputDecorationTheme: InputDecorationTheme(

        //Content padding
        contentPadding: const EdgeInsets.all(14),

        //label text style
        labelStyle: TextStyle(
            fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
            fontSize: 12.sp, color: ColorsLight.darkGrey,),

        //hint style
        hintStyle: TextStyle(
            fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
            fontSize: 12.sp, color: ColorsLight.grey,),

        //error style
        errorStyle: TextStyle(
            fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
            fontSize: 10.sp, color: ColorsLight.error,),



        //background color
        filled: true,
        fillColor: ColorsLight.white,

        //focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsLight.lightBlue),
            borderRadius: BorderRadius.circular(
                18.sp,
            ),),


        //enable border style
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                14.sp,
            ),
            borderSide:
            BorderSide(color: ColorsLight.darkGrey, width: 0.4.w),),

        //error border style
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.sp),
            borderSide:
            BorderSide(color: ColorsLight.error, width: 0.1.w),),


        // error focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.sp),
            borderSide:
            BorderSide(color: ColorsLight.error, width: 0.1.w),),
      ),
  );
}
