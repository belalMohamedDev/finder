import 'package:finder/presentation/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/presentation/resources/asset_manger.dart';
import 'package:finder/presentation/resources/color_manger.dart';
import 'package:finder/presentation/resources/route_manger.dart';
import 'package:finder/presentation/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';
import '../../../application/app_prefs.dart';
import '../../../application/di.dart';
import '../../resources/values_manger.dart';
import '../viewModel/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //instant
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _userNationalId = TextEditingController();
  final TextEditingController _userPassword = TextEditingController();
  final AppPreferences _appPreferences=instance<AppPreferences>();


  final _formKey = GlobalKey<FormState>();
  _bind() {
    _viewModel.start(); //tell view model start your job
    _userNationalId
        .addListener(() => _viewModel.setNationalId(_userNationalId.text));
    _userPassword.addListener(() => _viewModel.setPassword(_userPassword.text));
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
      body: StreamBuilder<FlowState>(stream: _viewModel.outState,builder: (context,snapshot){
        return snapshot.data?.getScreenWidget(context,_getContentWidget(),(){
          _viewModel.login();
        })?? _getContentWidget();
      }),
    );
  }

  Widget _getContentWidget() {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: AppPadding.p8.h),
                SvgPicture.asset(
                  ImageAsset.login,
                ),

                SizedBox(
                  height: AppPadding.p3.h,
                ),
                _stackCustom(),
                _colum(),
                SizedBox(
                  height: AppPadding.p5.h,
                ),
              ],
            ),
          ),
        ),
      );

  }

  Widget _colum() {
    return Padding(
      padding: EdgeInsets.only(
        top: AppPadding.p3.h,
        left: AppPadding.p5.w,
        right: AppPadding.p5.w,
      ),
      child: Column(
        children: [
          StreamBuilder<bool>(
              stream: _viewModel.outIsNationalIdValid,
              builder: (context, snapshot) {
                return TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller: _userNationalId,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.badge, size: APPSize.s19.sp),
                      labelText: AppStrings.nationalNumber,
                      hintText: AppStrings.nationalNumber,
                      errorText: (snapshot.data ?? true)
                          ? null
                          : AppStrings.nationalIdError),
                );
              }),
          SizedBox(
            height: AppPadding.p2.h,
          ),
          StreamBuilder<bool>(
              stream: _viewModel.outIsPasswordValid,

              builder: (context, snapshot) {

                return    StatefulBuilder(builder: (context, setState) {
                  return  TextFormField(
                    onEditingComplete:()=> _viewModel.login(),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _userPassword,
                    obscureText: _viewModel.showPass,
                    decoration: InputDecoration(
                        suffixIcon:
                        IconButton(
                            onPressed: (){
                              _viewModel.showPass=!_viewModel.showPass;
                              setState(() {

                              });
                            },
                            icon: _viewModel.showPass
                                ? Icon(Icons.remove_red_eye_rounded,
                                color: Colors.grey, size: APPSize.s19.sp)
                                : Icon(Icons.visibility_off,
                                color: Colors.blue, size: APPSize.s19.sp)),
                        prefixIcon: Icon(Icons.lock, size: APPSize.s19.sp),
                        labelText: AppStrings.password,
                        hintText: AppStrings.password,
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.passwordError),
                  );
                },);



              }),
          SizedBox(
            height: AppPadding.p3.h,
          ),
          SizedBox(
            width: double.infinity,
            height: AppPadding.p6_7.h,
            child: StreamBuilder<bool>(
                stream: _viewModel.outAreAllInputsValid,
                builder: (context, snapshot) {
                  return Card(
                    color: ColorManger.darkBlue,
                    elevation: APPSize.s2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(APPSize.s8.sp),
                    ),
                    child: ElevatedButton(
                      onPressed: (snapshot.data ?? false)
                          ? () {
                              _viewModel.login();
                            }
                          : null,
                      child: const Text(
                        AppStrings.loginButton,
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(APPSize.s10)),
                          primary: ColorManger.darkBlue),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _stackCustom() {
    return Container(
        alignment: Alignment.center,
        width: AppPadding.p73.w,
        height: AppPadding.p7_5.h,
        child: Stack(
          children: [
            Positioned(
              right: AppPadding.p8.w,
              top: 0.8.h,
              bottom: 1.2.h,
              left: AppPadding.p27.w,
              child: ElevatedButton(
                onPressed: () => _viewModel.signUp(context),
                style: ElevatedButton.styleFrom(
                    primary: ColorManger.white, onPrimary: ColorManger.grey),
                child: Text(AppStrings.signUp,
                    style: TextStyle(
                      color: ColorManger.black,
                    )),
              ),
            ),
            Positioned(
              right: AppPadding.p32.w,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  AppStrings.login,
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
