import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/images/app_images.dart';

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
          Center(
            child: SvgPicture.asset(
              ImageAsset.splashLogo,
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
