import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/feature/signUp/presentation/refactors/text_form_register_button.dart';

import 'package:finder/feature/signUp/presentation/widgets/image_button.dart';

import 'package:finder/feature/signUp/presentation/widgets/sign_up_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 22.w),
        child: CustomFadeInRight(
          duration: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFadeInUp(
                duration:1 ,
                child: Text(
                  LangKeys.register,
                  style: TextStyle(
                    color: ColorsLight.blue,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomFadeInUp(
                duration: 2,
                child: Text(
                  LangKeys.titleRegister,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorsLight.lightBlack,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              const CustomFadeInUp(duration: 2,child: ImageButton(),),
              SizedBox(
                height: 30.h,
              ),
              const CustomFadeInUp(
                duration: 1,
                child: Center(
                    child: SignUpAndLoginButton(),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const CustomFadeInRight(duration: 1, child: TextFormAndRegisterButton()),
            ],
          ),
        ),
      ),
    );
  }
}
