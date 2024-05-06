import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/core/routing/routes.dart';

import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:finder/feature/updateUserData/logic/cubit/update_user_data_cubit.dart';
import 'package:finder/feature/updateUserData/presentation/widgets/first_and_last_name_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateUserDataBody extends StatelessWidget {
  const UpdateUserDataBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
        duration: 1,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 160.h),
            child: Form(
              key: context.read<UpdateMyDataCubit>().formKey,
              child: BlocBuilder<UpdateMyDataCubit, UpdateMyDataState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 400.h,
                    child: Card(
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
                            const FirstAndLastNameFieldUserDataScreen(),
                            SizedBox(
                              height: 25.h,
                            ),

                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.streetAddress,
                              controller:
                                  context.read<UpdateMyDataCubit>().userAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_pin,
                                    size: 16.sp, color: ColorsLight.grey),
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),

                            TextFormField(
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.phone,
                              controller:
                                  context.read<UpdateMyDataCubit>().userPhone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a new phone';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone_iphone_outlined,
                                    size: 16.sp, color: ColorsLight.grey),
                              ),
                            ),

                            SizedBox(
                              height: 25.h,
                            ),

                            // Simulated second dialog
                            CustomFadeInLeft(
                              duration: 1,
                              child: BlocListener<UpdateMyDataCubit,
                                  UpdateMyDataState>(
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
                                    },
                                    success: (userData) async {
                                      context.pop();

                                      context.pushNamedAndRemoveUntil(
                                        Routes.bottomNavBarRoute,
                                        predicate: (Route<dynamic> route) =>
                                            false,
                                      );
                                    },
                                  );
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    validateThenDoUpdateUserData(context);
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
                                        'Update My Data',
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

void validateThenDoUpdateUserData(BuildContext context) {
  if (context.read<UpdateMyDataCubit>().formKey.currentState!.validate()) {
    context.read<UpdateMyDataCubit>().updateUserData();
  }
}
