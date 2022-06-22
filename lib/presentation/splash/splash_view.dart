import 'dart:async';

import 'package:finder/presentation/resources/asset_manger.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../application/app_prefs.dart';
import '../../application/di.dart';

import '../resources/color_manger.dart';
import '../resources/constant_manger.dart';
import '../resources/route_manger.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  //instance
  Timer? _timer;
  final AppPreferences _appPreferences=instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstant.splashDelay), _goNext);
  }

  _goNext()async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
      if(isUserLoggedIn){
        //navigate to main screen
        Navigator.pushReplacementNamed(context, Routes.bottomNavBarRoute),
      }else{
        _appPreferences.isOnBoardingScreenView().then((isOnBoardingScreenView) => {
          if(isOnBoardingScreenView){
            //navigate to login screen
            Navigator.pushReplacementNamed(context, Routes.loginRoute)
          }else{
            //navigate to onBoarding screen
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute)
          }
        })
      }
    });

  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
       Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Center(child: SvgPicture.asset(ImageAsset.splashLogo,height: 500),),
           SpinKitSquareCircle(
             color: ColorManger.blue1,
             size: 40.0,
           ),
         ],
       )

    );
  }

  // AssetImage(ImageAsset.splashLogo)

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

