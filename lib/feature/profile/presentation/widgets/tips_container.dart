import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:finder/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:finder/feature/profile/presentation/widgets/show_dialog_log_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipsContainersProfile extends StatelessWidget {
  const TipsContainersProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.tipsView);
          },
          child: Card(
            color: ColorsLight.lightWhiteColor,
            elevation: 8.sp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.sp),
              ),
            ),
            child: Container(
              height: 48.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                  border: Border.all(
                    color: ColorsLight.lightBlueDegree,
                  )),
              child: Row(children: [
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  Icons.lightbulb,
                  color: ColorsLight.lightYellow,
                ),
                SizedBox(
                  width: 10.w,
                ),
                const Text(LangKeys.tips)
              ]),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        InkWell(
          onTap: () {
            context.pushNamed(Routes.aboutApp);
          },
          child: Card(
            color: ColorsLight.lightWhiteColor,
            elevation: 8.sp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.sp),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                  border: Border.all(
                    color: ColorsLight.lightBlueDegree,
                  )),
              height: 48.h,
              width: double.infinity,
              child: Row(children: [
                SizedBox(
                  width: 10.w,
                ),
                const Icon(Icons.error_outline_rounded),
                SizedBox(
                  width: 10.w,
                ),
                const Text(LangKeys.about)
              ]),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        InkWell(
          onTap: () {
            logOutShowDialog(profileCubitInstance: context.read<ProfileCubit>(),context: context);
          },
          child: Card(
            color: ColorsLight.lightWhiteColor,
            elevation: 8.sp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.sp),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                  border: Border.all(
                    color: ColorsLight.lightBlueDegree,
                  )),
              height: 48.h,
              width: double.infinity,
              child: Row(children: [
                SizedBox(
                  width: 10.w,
                ),
                const Icon(Icons.add_to_home_screen_sharp),
                SizedBox(
                  width: 10.w,
                ),
                const Text(LangKeys.logOut)
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
