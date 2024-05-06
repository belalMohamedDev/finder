import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:finder/feature/login/presentation/refactors/text_form_login_button.dart';


import 'package:finder/feature/login/presentation/widgets/login_signup_button.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 40.h),
          child: CustomFadeInRight(
            duration: 1,
            child: Column(
              children: [
                CustomFadeInUp(
                  duration: 2,
                  child: SvgPicture.asset(
                    ImageAsset.login,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.w),
                  child: const CustomFadeInDown(
                    duration: 1,
                    child: LoginAndSignUpButton(),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                const CustomFadeInRight(
                  duration: 1,
                  child: TextFormAndLoginButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
