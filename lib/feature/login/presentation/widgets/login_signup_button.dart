import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginAndSignUpButton extends StatelessWidget {
  const LoginAndSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      child: Stack(
        children: [
          Positioned(
            right: 28.w,
            top: 6.h,
            bottom: 4.h,
            left: 100.w,
            child: ElevatedButton(
              onPressed: () {
                context.pushReplacementNamed(Routes.registerRoute);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: ColorsLight.grey,
                backgroundColor: ColorsLight.white,
              ),
              child: Text(
                LangKeys.signUp,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 11.sp),
              ),
            ),
          ),
          Positioned(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                LangKeys.login,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
