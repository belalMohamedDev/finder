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

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController nationalNumber = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController location = TextEditingController();
    File? image;
    var formKey = GlobalKey<FormState>();

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
                      top:
                          SizerUtil.deviceType == DeviceType.mobile ?AppPadding.p2.h :AppPadding.p3.h,
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
                                 fontWeight: FontWeightManger.bold
                             ),
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
                        const Center(child: _StackCustom()),
                        SizedBox(
                          height: SizerUtil.deviceType == DeviceType.mobile
                              ? AppPadding.p1.h
                              : AppPadding.p2.h,
                        ),
                        _ColumnTextForm(
                            name: name,
                            nationalNumber: nationalNumber,
                            email: email,
                            password: password,
                            confirmPassword: confirmPassword,
                            location: location,
                            phone: phone),
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
                      child:  Text(
                        AppStrings.registerNow,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(APPSize.s0.sp)),
                          primary: ColorManger.lightBlue),
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
}

class _ColumnTextForm extends StatefulWidget {
  const _ColumnTextForm({
    Key? key,
    required this.name,
    required this.nationalNumber,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.location,
    required this.phone,
  }) : super(key: key);

  final TextEditingController name;
  final TextEditingController nationalNumber;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final TextEditingController location;
  final TextEditingController phone;

  @override
  State<_ColumnTextForm> createState() => _ColumnTextFormState();
}

bool showPass = true;
bool showConfPass = true;

class _ColumnTextFormState extends State<_ColumnTextForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            controller: widget.name,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                size: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p19.sp : AppPadding.p10.sp,
              ),
              labelText: AppStrings.name,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p1.h : AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            controller: widget.nationalNumber,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.badge,
                size: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p19.sp : AppPadding.p10.sp,
              ),
              labelText: AppStrings.nationalNumber,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p1.h : AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: widget.email,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                size: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p19.sp : AppPadding.p10.sp,
              ),
              labelText: AppStrings.email,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p1.h : AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            controller: widget.password,
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
                size: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p19.sp : AppPadding.p10.sp,
              ),
              labelText: AppStrings.password,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p1.h : AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            controller: widget.confirmPassword,
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
                size: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p19.sp : AppPadding.p10.sp,
              ),
              labelText: AppStrings.confirmPassword,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p1.h : AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.streetAddress,
            controller: widget.location,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.location_on,
                size: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p19.sp : AppPadding.p10.sp,
              ),
              labelText: AppStrings.address,
            )),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p1.h :AppPadding.p2.h,
        ),
        TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            controller: widget.phone,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone,
                size: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p19.sp : AppPadding.p10.sp,
              ),
              labelText: AppStrings.phoneNumber,
            )),
      ],
    );
  }
}

class _StackCustom extends StatelessWidget {
  const _StackCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ? AppPadding.p3.w
                  : AppPadding.p16.w,
              top: AppPadding.p0_7.h,
              bottom: AppPadding.p1_2.h,
              left: SizerUtil.deviceType == DeviceType.mobile ? AppPadding.p28.w : AppPadding.p30.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                style: ElevatedButton.styleFrom(onPrimary: ColorManger.grey),
                child: Text(AppStrings.loginSignUp,
                    style: TextStyle(
                      color: ColorManger.black,
                    )),
              ),
            ),
            Positioned(
              right: SizerUtil.deviceType == DeviceType.mobile
                  ? AppPadding.p30.w
                  : AppPadding.p34.w,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  AppStrings.signUp1,
                ),
                style: ElevatedButton.styleFrom(
                  primary: ColorManger.darkBlue,
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
