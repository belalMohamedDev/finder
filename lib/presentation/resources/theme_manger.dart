import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'color_manger.dart';
import 'font_manger.dart';
import 'styles_manger.dart';
import 'values_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(


//main color
      primaryColor: ColorManger.backGround,
      scaffoldBackgroundColor: ColorManger.backGround,
//Button theme
      buttonTheme: ButtonThemeData(
          buttonColor: ColorManger.lightBlue,
          disabledColor: ColorManger.darkBlue,
          splashColor: ColorManger.blue,
          shape: const StadiumBorder()),

//elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: getBoldStyle(
              fontSize: FontSize.s13.sp,
              color: ColorManger.darkBlue,
            ),
            primary: ColorManger.darkBlue,
            onPrimary: ColorManger.white,
            onSurface: ColorManger.darkBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(APPSize.s24.sp)),
            fixedSize: Size.fromHeight(AppPadding.p46.sp),
          )),

//appbar theme
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManger.backGround,
              statusBarIconBrightness: Brightness.dark),
          centerTitle: true,
          elevation: APPSize.s0,
          iconTheme: IconThemeData(
            color:  ColorManger.white,
            size: AppPadding.p20.sp,
          ),
          titleTextStyle: getMediumStyle(
            fontSize: FontSize.s15.sp,
            color: ColorManger.white,
          ),
          color: ColorManger.backGround),

//text theme

      textTheme: TextTheme(
// using in text on boarding
        titleLarge: getBoldStyle(
          fontSize: FontSize.s16.sp,
          color: ColorManger.black,
        ),
//using in profile page
        headlineSmall: getMediumStyle(
            fontSize: FontSize.s14.sp, color: ColorManger.blackText),

//using in missing page
        bodySmall: getRegularStyle(
            fontSize: FontSize.s13.sp, color: ColorManger.black),

// using in text on boarding
        headlineMedium: getMediumStyle(
          fontSize: FontSize.s14.sp,
          color: ColorManger.black,
        ),

//use in on boarding  button
        titleSmall: getSemiBoldStyle(
          fontSize: FontSize.s12.sp,
          color: ColorManger.black,
        ),

//use in on boarding  button
        headlineLarge: getMediumStyle(
          fontSize: FontSize.s12.sp,
          color: ColorManger.white,
        ),
          //use in on about profile page
        bodyLarge: getMediumStyle(
            fontSize:FontSize.s14.sp,
            color: ColorManger.blackText),
      ),

/// input decoration theme ( text form field )
      inputDecorationTheme: InputDecorationTheme(
        //Content padding
        contentPadding: const EdgeInsets.all(AppPadding.p19),

        //label text style
        labelStyle: getMediumStyle(
            fontSize: FontSize.s12.sp, color: ColorManger.darkGrey),

        //hint style
        hintStyle: getRegularStyle(
            fontSize: FontSize.s12.sp, color: ColorManger.grey),

        //error style
        errorStyle: getRegularStyle(
            fontSize: FontSize.s10.sp, color: ColorManger.error),



        //background color
        filled: true,
        fillColor: ColorManger.white,

        //focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.lightBlue),
            borderRadius: BorderRadius.circular(
                APPSize.s18.sp
            )),


        //enable border style
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                APPSize.s10.sp
            ),
            borderSide:
            BorderSide(color: ColorManger.darkGrey, width: AppPadding.p0_1.w)),

        //error border style
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(APPSize.s12.sp),
            borderSide:
            BorderSide(color: ColorManger.error, width: AppPadding.p0_1.w)),


        // error focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(APPSize.s12.sp),
            borderSide:
            BorderSide(color: ColorManger.error, width: AppPadding.p0_1.w)),
      ));
}