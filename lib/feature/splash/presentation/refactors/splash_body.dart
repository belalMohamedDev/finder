import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Bounce(
            child: ShakeX(
              delay: const Duration(seconds: 1),
              duration: const Duration(seconds: 2),
              child: Center(
                child: SvgPicture.asset(
                  ImageAsset.splashLogo,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          const SpinKitSquareCircle(
            color: ColorsLight.blueD8,
            size: 30,
          ),
        ],
      ),
    );
  }
}
