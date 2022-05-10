import 'dart:io';

import 'package:finder/presentation/resources/color_manger.dart';
import 'package:finder/presentation/resources/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:size_helper/size_helper.dart';
import 'package:sizer/sizer.dart';

import '../../resources/route_manger.dart';
import '../../resources/strings_manger.dart';
import '../../resources/values_manger.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController name = TextEditingController();

  TextEditingController nationalNumber = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController location = TextEditingController();

  bool showPass = true;

  bool showConfPass = true;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    File? image;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: SizerUtil.deviceType == DeviceType.mobile
                          ? AppPadding.p2.h
                          : AppPadding.p3.h,
                      right: AppPadding.p5.w,
                      left: AppPadding.p5.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.register,
                          style: TextStyle(
                              color: ColorManger.blue,
                              fontSize:
                                  SizerUtil.deviceType == DeviceType.mobile
                                      ? AppPadding.p28.sp
                                      : AppPadding.p23.sp,
                              fontWeight: FontWeightManger.bold),
                        ),
                        Text(
                          AppStrings.titleRegister,
                          style: TextStyle(
                              fontSize:
                                  SizerUtil.deviceType == DeviceType.mobile
                                      ? AppPadding.p13.sp
                                      : AppPadding.p10.sp,
                              color: ColorManger.lightBlack),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: SizerUtil.deviceType == DeviceType.mobile
                                  ? AppPadding.p1.h
                                  : AppPadding.p3.h),
                          child: Center(
                            child: MaterialButton(
                              highlightColor: ColorManger.gradationLightBlue,
                              // onPressed: () => controller.pickImage(),
                              onPressed: () {},
                              child: image != null
                                  ? Container(
                                      height: AppPadding.p15.h,
                                      width: AppPadding.p35.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(APPSize.s50.sp)),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(image))),
                                    )
                                  : SvgPicture.asset("asset/images/camera.svg",
                                      height: 14.h),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? AppPadding.p1.h
                              : AppPadding.p2.h,
                        ),
                        Center(child: _stackCustom()),
                        SizedBox(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? AppPadding.p1.h
                              : AppPadding.p2.h,
                        ),
                        _columnTextForm(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeHelper.of(context).help(
                        tabletLarge: AppPadding.p90.h,
                        tabletSmall: AppPadding.p125.h,
                        mobileExtraLarge: AppPadding.p130.h,
                        desktopSmall: AppPadding.p92.h),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: AppPadding.p6_5.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        AppStrings.registerNow,
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(APPSize.s0.sp)),
                          primary: ColorManger.darkBlue),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _columnTextForm() {
    return Column(
      children: [
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            controller: name,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                size: SizerUtil.deviceType == DeviceType.mobile
                    ? AppPadding.p19.sp
                    : AppPadding.p10.sp,
              ),
              labelText: AppStrings.name,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile
              ? AppPadding.p1.h
              : AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            controller: nationalNumber,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.badge,
                size: SizerUtil.deviceType == DeviceType.mobile
                    ? AppPadding.p19.sp
                    : AppPadding.p10.sp,
              ),
              labelText: AppStrings.nationalNumber,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile
              ? AppPadding.p1.h
              : AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: email,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                size: SizerUtil.deviceType == DeviceType.mobile
                    ? AppPadding.p19.sp
                    : AppPadding.p10.sp,
              ),
              labelText: AppStrings.email,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile
              ? AppPadding.p1.h
              : AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            controller: password,
            obscureText: showPass,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    showPass = !showPass;
                    setState(() {});
                  },
                  icon: showPass
                      ? Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.grey,
                          size: SizerUtil.deviceType == DeviceType.mobile
                              ? AppPadding.p19.sp
                              : AppPadding.p10.sp,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.blue,
                          size: SizerUtil.deviceType == DeviceType.mobile
                              ? AppPadding.p19.sp
                              : AppPadding.p10.sp,
                        )),
              prefixIcon: Icon(
                Icons.lock,
                size: SizerUtil.deviceType == DeviceType.mobile
                    ? AppPadding.p19.sp
                    : AppPadding.p10.sp,
              ),
              labelText: AppStrings.password,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile
              ? AppPadding.p1.h
              : AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            controller: confirmPassword,
            obscureText: showConfPass,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    showConfPass = !showConfPass;
                    setState(() {});
                  },
                  icon: showConfPass
                      ? Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.grey,
                          size: SizerUtil.deviceType == DeviceType.mobile
                              ? AppPadding.p19.sp
                              : AppPadding.p10.sp,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.blue,
                          size: SizerUtil.deviceType == DeviceType.mobile
                              ? AppPadding.p19.sp
                              : AppPadding.p10.sp,
                        )),
              prefixIcon: Icon(
                Icons.lock,
                size: SizerUtil.deviceType == DeviceType.mobile
                    ? AppPadding.p19.sp
                    : AppPadding.p10.sp,
              ),
              labelText: AppStrings.confirmPassword,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile
              ? AppPadding.p1.h
              : AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.streetAddress,
            controller: location,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.location_on,
                size: SizerUtil.deviceType == DeviceType.mobile
                    ? AppPadding.p19.sp
                    : AppPadding.p10.sp,
              ),
              labelText: AppStrings.address,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile
              ? AppPadding.p1.h
              : AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            controller: phone,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone,
                size: SizerUtil.deviceType == DeviceType.mobile
                    ? AppPadding.p19.sp
                    : AppPadding.p10.sp,
              ),
              labelText: AppStrings.phoneNumber,
            )),
      ],
    );
  }

  Widget _stackCustom() {
    return SizedBox(
        width: AppPadding.p80.w,
        height: SizeHelper.of(context).help(
            tabletLarge: AppPadding.p7_5.h,
            tabletSmall: AppPadding.p10_5.h,
            mobileExtraLarge: AppPadding.p11.h,
            desktopSmall: AppPadding.p7_5.h),
        child: Stack(
          children: [
            Positioned(
              right: SizerUtil.deviceType == DeviceType.mobile
                  ? AppPadding.p9.w
                  : AppPadding.p16.w,
              top: AppPadding.p0_7.h,
              bottom: AppPadding.p1_2.h,
              left: SizerUtil.deviceType == DeviceType.mobile
                  ? AppPadding.p28.w
                  : AppPadding.p30.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                style: ElevatedButton.styleFrom(
                    onPrimary: ColorManger.grey, primary: ColorManger.white),
                child: Text(AppStrings.loginSignUp,
                    style: TextStyle(
                      color: ColorManger.black,
                    )),
              ),
            ),
            Positioned(
              right: SizerUtil.deviceType == DeviceType.mobile
                  ? AppPadding.p36.w
                  : AppPadding.p34.w,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  AppStrings.signUp1,
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(
                      SizerUtil.deviceType == DeviceType.mobile
                          ? AppPadding.p46.sp
                          : AppPadding.p32.sp),
                ),
              ),
            ),
          ],
        ));
  }
}
