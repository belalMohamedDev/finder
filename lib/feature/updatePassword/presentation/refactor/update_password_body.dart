import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:finder/feature/updatePassword/logic/cubit/update_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePasswordBody extends StatelessWidget {
  const UpdatePasswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
        duration: 1,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 160.h),
            child: Form(
              key: context.read<UpdatePasswordCubit>().formKey,
              child: BlocBuilder<UpdatePasswordCubit, UpdatePasswordState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 400.h,
                    child: Card(
                      // color: Colors.black45,
                      // elevation: 5,
                      color: ColorsLight.blue1,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      elevation: 20,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              controller: context
                                  .read<UpdatePasswordCubit>()
                                  .userCurrentPassword,
                              obscureText: context
                                  .read<UpdatePasswordCubit>()
                                  .showCurrentPassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a current password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock,
                                    size: 16.sp, color: ColorsLight.grey),
                                suffixIcon: IconButton(
                                  onPressed: () => context
                                      .read<UpdatePasswordCubit>()
                                      .showCurrentPass(),
                                  icon: context
                                          .read<UpdatePasswordCubit>()
                                          .showCurrentPassword
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
                                labelText: LangKeys.currentPassword,
                                hintText: LangKeys.currentPassword,
                              ),
                            ),

                            SizedBox(
                              height: 25.h,
                            ),

                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              controller: context
                                  .read<UpdatePasswordCubit>()
                                  .userNewPassword,
                              obscureText: context
                                  .read<UpdatePasswordCubit>()
                                  .showNewPassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a new password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock,
                                    size: 16.sp, color: ColorsLight.grey),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    context
                                        .read<UpdatePasswordCubit>()
                                        .showNewPass();
                                  },
                                  icon: context
                                          .read<UpdatePasswordCubit>()
                                          .showNewPassword
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
                                labelText: LangKeys.newPassword,
                                hintText: LangKeys.newPassword,
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),

                            TextFormField(
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              controller: context
                                  .read<UpdatePasswordCubit>()
                                  .userNewPasswordConfirm,
                              obscureText: context
                                  .read<UpdatePasswordCubit>()
                                  .showConfirmPassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a new password confirm';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock,
                                    size: 16.sp, color: ColorsLight.grey),
                                suffixIcon: IconButton(
                                  onPressed: () => context
                                      .read<UpdatePasswordCubit>()
                                      .showConfirmPass(),
                                  icon: context
                                          .read<UpdatePasswordCubit>()
                                          .showConfirmPassword
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
                                labelText: LangKeys.confirmNewPassword,
                                hintText: LangKeys.confirmNewPassword,
                              ),
                            ),

                            SizedBox(
                              height: 25.h,
                            ),

                            // Simulated second dialog
                            CustomFadeInLeft(
                              duration: 1,
                              child: BlocListener<UpdatePasswordCubit,
                                  UpdatePasswordState>(
                                listenWhen: (previous, current) =>
                                    current is Loading ||
                                    current is Success ||
                                    current is Error,
                                listener: (context, state) {
                                  state.whenOrNull(
                                    loading: (flowStat) {
                                      flowStat.getScreenWidget(
                                          context: context,
                                          retryActionFunction: () {});
                                    },
                                    error: (flowStat) {
                                      flowStat.getScreenWidget(
                                          context: context,
                                          retryActionFunction: () {});

                                      context
                                          .read<UpdatePasswordCubit>()
                                          .userCurrentPassword
                                          .clear();
                                      context
                                          .read<UpdatePasswordCubit>()
                                          .userNewPassword
                                          .clear();
                                      context
                                          .read<UpdatePasswordCubit>()
                                          .userNewPasswordConfirm
                                          .clear();
                                    },
                                    success: (userData) async {
                                      context.pop();
                                      context
                                          .read<UpdatePasswordCubit>()
                                          .userCurrentPassword
                                          .clear();
                                      context
                                          .read<UpdatePasswordCubit>()
                                          .userNewPassword
                                          .clear();
                                      context
                                          .read<UpdatePasswordCubit>()
                                          .userNewPasswordConfirm
                                          .clear();
                                    },
                                  );
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    validateThenDoUpdatePassword(context);
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius:
                                          BorderRadius.circular(12.sp),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Update My Password',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                                color: ColorsLight.backGround,
                                                fontFamily: FontFamilyHelper
                                                    .cairoArabic),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}

void validateThenDoUpdatePassword(BuildContext context) {
  if (context.read<UpdatePasswordCubit>().formKey.currentState!.validate()) {
    context.read<UpdatePasswordCubit>().updatePassword();
  }
}
