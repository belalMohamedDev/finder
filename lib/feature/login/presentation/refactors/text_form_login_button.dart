import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/services/shared_pref/pref_keys.dart';
import 'package:finder/core/services/shared_pref/shared_pref.dart';

import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/app_regex.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:finder/feature/login/logic/viewModel/login_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormAndLoginButton extends StatelessWidget {
  const TextFormAndLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return SizedBox(
      child: Form(
        key: loginCubit.formKey,
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: loginCubit.userPhone,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPhoneNumberValid(value)) {
                  return 'Please enter a valid phone';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  size: 16.sp,
                  color: ColorsLight.grey,
                ),
                labelText: LangKeys.phoneNumber,
                hintText: LangKeys.phoneNumber,
              ),
            ),

            SizedBox(
              height: 12.h,
            ),

            BlocBuilder<LoginCubit, LoginState<dynamic>>(
              builder: (context, state) {
                return TextFormField(
                  onEditingComplete: loginCubit.login,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  controller: loginCubit.userPassword,
                  obscureText: loginCubit.showPass,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: loginCubit.showPassword,
                      icon: loginCubit.showPass
                          ? Icon(
                              Icons.remove_red_eye_rounded,
                              color: Colors.grey,
                              size: 19.sp,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Colors.blue,
                              size: 19.sp,
                            ),
                    ),
                    prefixIcon:
                        Icon(Icons.lock, size: 16.sp, color: ColorsLight.grey),
                    labelText: LangKeys.password,
                    hintText: LangKeys.password,
                  ),
                );
              },
            ),

            SizedBox(
              height: 25.h,
            ),

            //
            BlocListener<LoginCubit, LoginState<dynamic>>(
              listenWhen: (previous, current) =>
                  current is Loading || current is Success || current is Error,
              listener: (context, state) {
                state.whenOrNull(
                  loading: (flowStat) {
                    flowStat.getScreenWidget(context: context,retryActionFunction:  (){});
                  },
                  error: (flowStat) {
                    flowStat.getScreenWidget(context:  context,retryActionFunction:  (){});
                  },
                  success: (userData) async {
                    context.pop();

                    SharedPref().setBoolean(PrefKeys.isUserLoggedIn, true);
                    SharedPref().setString(PrefKeys.userToken, userData.token);
                    SharedPref()
                        .setString(PrefKeys.userName, userData.data?.name);
                    SharedPref().setString(
                        PrefKeys.userImage, userData.data?.image ?? "");
                    SharedPref()
                        .setString(PrefKeys.userPhone, userData.data?.phone);
                    SharedPref().setString(
                        PrefKeys.userAddress, userData.data?.address);


                     

                    context.pushReplacementNamed(Routes.bottomNavBarRoute);
                  },
                );
              },
              child: SizedBox(
                width: double.infinity,
                height: 45.h,
                child: ElevatedButton(
                  onPressed: () => validateThenDoLogin(context),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    backgroundColor: ColorsLight.darkBlue,
                  ),
                  child: const Text(
                    LangKeys.loginButton,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().login();
  }
}
