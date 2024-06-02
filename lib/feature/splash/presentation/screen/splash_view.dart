import 'dart:async';

import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/services/shared_pref/pref_keys.dart';
import 'package:finder/core/services/shared_pref/shared_pref.dart';

import 'package:finder/feature/splash/presentation/refactors/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  void startDelay() {
    _timer = Timer(const Duration(seconds: 3), goNext);
  }

  ///this function to mange navigate to next
  Future<void> goNext() async {
      SharedPref().getBoolean(PrefKeys.isUserLoggedIn).then((isUserLoggedIn) => {
      if(isUserLoggedIn!){
        //navigate to main screen
        Navigator.pushReplacementNamed(context, Routes.bottomNavBarRoute),
      }else{
        SharedPref().getBoolean(PrefKeys.onBoardingScreen).then((isOnBoardingScreenView) => {
          if(isOnBoardingScreenView!){
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
    startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashBody();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
