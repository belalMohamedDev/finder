import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/services/shared_pref/pref_keys.dart';
import 'package:finder/core/services/shared_pref/shared_pref.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/app_regex.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:finder/feature/signUp/logic/viewModel/register_cubit.dart';
import 'package:finder/feature/signUp/presentation/widgets/first_last_field.dart';
import 'package:finder/feature/signUp/presentation/widgets/phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormAndRegisterButton extends StatelessWidget {
  const TextFormAndRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return Form(
      key: registerCubit.formKey,
      child: Column(
        children: [
          const FirstAndLastNameField(),
          SizedBox(
            height: 15.h,
          ),
          const PhoneTextField(),
          SizedBox(
            height: 15.h,
          ),
          BlocBuilder<RegisterCubit, RegisterState<dynamic>>(
            builder: (context, state) {
              return TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                controller: registerCubit.userPassword,
                obscureText: registerCubit.showPass,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: registerCubit.showPassword,
                    icon: registerCubit.showPass
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
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 16.sp,
                    color: Colors.grey,
                  ),
                  labelText: LangKeys.password,
                  hintText: LangKeys.password,
                ),
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          TextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isNameValid(value)) {
                return 'Please enter a valid location';
              }
              return null;
            },
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.streetAddress,
            controller: registerCubit.userAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.location_on,
                size: 19.sp,
                color: Colors.grey,
              ),
              labelText: LangKeys.address,
              hintText: LangKeys.address,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          BlocListener<RegisterCubit, RegisterState<dynamic>>(
            listenWhen: (previous, current) =>
                current is Loading || current is Success || current is Error,
            listener: (context, state) {
              state.whenOrNull(
                loading: (flowStat) {
                  flowStat.getScreenWidget(context: context,retryActionFunction:  (){});
                },
                error: (flowStat) {
                  flowStat.getScreenWidget(context: context,retryActionFunction:  (){});
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
                  SharedPref()
                      .setString(PrefKeys.userAddress, userData.data?.address);

                  context.pushReplacementNamed(Routes.bottomNavBarRoute);
                },
              );
            },
            child: SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () => validateThenDoRegister(context),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  backgroundColor: ColorsLight.darkBlue,
                ),
                child: const Text(
                  LangKeys.registerNow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void validateThenDoRegister(BuildContext context) {
  if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
    context.read<RegisterCubit>().register();
  }
}
