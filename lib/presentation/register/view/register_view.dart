import 'dart:io';
import 'package:finder/presentation/resources/asset_manger.dart';
import 'package:finder/presentation/resources/color_manger.dart';
import 'package:finder/presentation/resources/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:lottie/lottie.dart';

import 'package:sizer/sizer.dart';

import '../../../application/app_prefs.dart';
import '../../../application/di.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';
import '../../resources/route_manger.dart';
import '../../resources/strings_manger.dart';
import '../../resources/values_manger.dart';
import '../viewModel/register_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();
  TextEditingController name = TextEditingController();

  TextEditingController nationalNumber = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController location = TextEditingController();
  final AppPreferences _appPreferences=instance<AppPreferences>();
  bool showPass = true;


  var formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    name.addListener(() {
      _viewModel.setUserName(name.text);
    });
    nationalNumber.addListener(() {
      _viewModel.setUserNationalId(nationalNumber.text);
    });

    email.addListener(() {
      _viewModel.setUserEmail(email.text);
    });

    password.addListener(() {
      _viewModel.setUserPassword(password.text);
    });
    location.addListener(() {
      _viewModel.setUserAddress(location.text);
    });
    phone.addListener(() {
      _viewModel.setUserPhone(phone.text);
    });

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream.listen((isLoggedIn) {
      if(isLoggedIn){
        //navigate to main screen
        SchedulerBinding.instance?.addPostFrameCallback((_) {
          _appPreferences.setLoginScreenView();
          Navigator.of(context).pushReplacementNamed(Routes.bottomNavBarRoute);
        });

      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.register();
                }) ??
                _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
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
                        fontSize: SizerUtil.deviceType == DeviceType.mobile
                            ? AppPadding.p28.sp
                            : AppPadding.p23.sp,
                        fontWeight: FontWeightManger.bold),
                  ),
                  Text(
                    AppStrings.titleRegister,
                    style: TextStyle(
                        fontSize: SizerUtil.deviceType == DeviceType.mobile
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
                          onPressed: () => _showPicker(context),
                          child: StreamBuilder<File>(
                              stream: _viewModel.outputPictureValid,
                              builder: (context, snapshot) {
                                return _imagePicketByUser(snapshot.data);
                              })),
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
        ),
      ),
    );
  }

  _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
              child: SizedBox(
            height: AppPadding.p15.h,
            child: Wrap(
              children: [
                ListTile(
                  trailing: const Icon(Icons.arrow_forward),
                  leading: const Icon(Icons.photo),
                  title: const Text(AppStrings.photoGallery),
                  onTap: () {
                    _viewModel.gallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  trailing: const Icon(Icons.arrow_forward),
                  leading: const Icon(Icons.camera_alt_rounded),
                  title: const Text(AppStrings.photoCamera),
                  onTap: () {
                    _viewModel.camera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ));
        });
  }

  Widget _imagePicketByUser(File? image) {
    if (image != null && image.path.isNotEmpty) {
      //return image
      return Container(
        height: AppPadding.p15.h,
        width: AppPadding.p35.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(APPSize.s50.sp)),
            image: DecorationImage(fit: BoxFit.cover, image: FileImage(image))),
      );
    } else {
      return Lottie.asset(JsonAsset.takePhoto,height:AppPadding.p16.h);

    }
  }

  Widget _columnTextForm() {
    return Column(
      children: [
        StreamBuilder<String?>(
          stream: _viewModel.outputNameErrorValid,
          builder: (context, snapshot) {
            return TextFormField(
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
                    hintText: AppStrings.name,
                    errorText: snapshot.data));
          },
        ),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile
              ? AppPadding.p1.h
              : AppPadding.p2.h,
        ),
        StreamBuilder<String?>(
          stream: _viewModel.outputNationalIdErrorValid,
          builder: (context, snapshot) {
            return TextFormField(
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
                    hintText: AppStrings.nationalNumber,
                    errorText: snapshot.data));
          },
        ),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile
              ? AppPadding.p1.h
              : AppPadding.p2.h,
        ),
        StreamBuilder<String?>(
          stream: _viewModel.outputEmailErrorValid,
          builder: (context, snapshot) {
            return TextFormField(
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
                    hintText: AppStrings.email,
                    errorText: snapshot.data));
          },
        ),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile
              ? AppPadding.p1.h
              : AppPadding.p2.h,
        ),
        StreamBuilder<String?>(
          stream: _viewModel.outputPasswordErrorValid,
          builder: (context, snapshot) {
            return StatefulBuilder(
              builder: (context, setState) {
                return TextFormField(
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
                                    size: SizerUtil.deviceType ==
                                            DeviceType.mobile
                                        ? AppPadding.p19.sp
                                        : AppPadding.p10.sp,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.blue,
                                    size: SizerUtil.deviceType ==
                                            DeviceType.mobile
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
                        hintText: AppStrings.password,
                        errorText: snapshot.data));
              },
            );
          },
        ),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile
              ? AppPadding.p1.h
              : AppPadding.p2.h,
        ),
        StreamBuilder<String?>(
          stream: _viewModel.outputPhoneErrorValid,
          builder: (context, snapshot) {
            return TextFormField(
                textInputAction: TextInputAction.next,
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
                    hintText: AppStrings.phoneNumber,
                    errorText: snapshot.data));
          },
        ),
        SizedBox(
          height: SizerUtil.deviceType == DeviceType.mobile
              ? AppPadding.p1.h
              : AppPadding.p2.h,
        ),
        StreamBuilder<String?>(
          stream: _viewModel.outputAddressErrorValid,
          builder: (context, snapshot) {
            return TextFormField(
                onEditingComplete:()=> _viewModel.register(),
                textInputAction: TextInputAction.done,
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
                    hintText: AppStrings.address,
                    errorText: snapshot.data));
          },
        ),
        SizedBox(height: AppPadding.p2.h),
        StreamBuilder<bool>(
          stream: _viewModel.outputAreAllInputValid,
          builder: (context, snapshot) {
            return SizedBox(
              width: double.infinity,
              height: AppPadding.p6_5.h,
              child: ElevatedButton(
                onPressed: (snapshot.data ?? false)
                    ? () {
                        _viewModel.register();
                      }
                    : null,
                child: const Text(
                  AppStrings.registerNow,
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(APPSize.s10.sp)),
                    primary: ColorManger.darkBlue),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _stackCustom() {
    return SizedBox(
        width: AppPadding.p80.w,
        height: AppPadding.p7_5.h,
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

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
