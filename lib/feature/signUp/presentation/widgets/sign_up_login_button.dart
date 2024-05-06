import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpAndLoginButton extends StatelessWidget {
  const SignUpAndLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w),
      child: SizedBox(
        width: 250.w,
        child: Stack(
          children: [
            Positioned(
              right: 30.w,
              top: 7.h,
              bottom: 5.h,
              left: 100.w,
              child: ElevatedButton(
                onPressed: () {
                  context.pushReplacementNamed(Routes.loginRoute);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: ColorsLight.grey,
                  backgroundColor: ColorsLight.white,
                ),
                child: Text(
                  LangKeys.loginSignUp,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 11.sp),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                LangKeys.signUp1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
