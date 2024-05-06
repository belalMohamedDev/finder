import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:finder/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> logOutShowDialog({
  required BuildContext context,
  required ProfileCubit profileCubitInstance,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.sp)),
          side: BorderSide(color: ColorsLight.white, width: 1.sp)),
      backgroundColor: ColorsLight.blue1,
      titleTextStyle: TextStyle(
          color: ColorsLight.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold),
      title: const Text(LangKeys.logOutSure),
      actions: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              border: Border.all(color: ColorsLight.white, width: 1.sp)),
          child: MaterialButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "Cancel",
              style: TextStyle(fontSize: 15.sp, color: ColorsLight.white),
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            profileCubitInstance.logout();
            context.pushNamedAndRemoveUntil(Routes.loginRoute,
                predicate: (Route<dynamic> route) => false);
          },
          child: Text(
            "yes",
            style: TextStyle(fontSize: 15.sp, color: ColorsLight.white),
          ),
        ),
      ],
    ),
  );
}
