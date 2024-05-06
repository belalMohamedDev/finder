import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:finder/feature/profile/logic/cubit/profile_cubit.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showPersonDataDialog({
  required BuildContext context,
  required ProfileCubit profileCubitInstance,
}) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor:
          Colors.black54, // Make AlertDialog background transparent
      content: ShowPersonDataDialogContent(
        profileCubitInstance: profileCubitInstance,
      ),
    ),
  );
}

class ShowPersonDataDialogContent extends StatelessWidget {
  final ProfileCubit profileCubitInstance;
  const ShowPersonDataDialogContent({
    required this.profileCubitInstance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Take as much width as possible
      height: 320.h,
      child: Column(
        children: [
          CustomFadeInDown(
            duration: 1,
            child: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                Icons.close,
                color: Colors.red[200],
                size: 22.sp,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomFadeInDown(
            duration: 1,
            child: Center(
              child: Image.asset(
                height: 110.h,
                ImageAsset.missing,
                fit: BoxFit.contain,
                color: ColorsLight.white,
              ),
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          CustomFadeInUp(
            duration: 1,
            child: ShowPersonDataDialogButton(
              profileCubitInstance: profileCubitInstance,
            ),
          ),
        ],
      ),
    );
  }
}

class ShowPersonDataDialogButton extends StatelessWidget {
  final ProfileCubit profileCubitInstance;
  const ShowPersonDataDialogButton({
    required this.profileCubitInstance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFadeInRight(
          duration: 1,
          child: GestureDetector(
            onTap: () {
              context.pop();

              Navigator.pushNamed(context, Routes.updatePasswordView);
            },
            child: Container(
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsLight.white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Center(
                child: Text(
                  'Update My Password',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 13.sp,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamilyHelper.cairoArabic),
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          height: 20.h,
        ),

        // Simulated second dialog
        CustomFadeInLeft(
          duration: 1,
          child: GestureDetector(
            onTap: () {
              context.pop();
              Navigator.pushNamed(context, Routes.updateUserDataView);
            },
            child: Container(
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsLight.darkBlue,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Center(
                child: Text(
                  'Update My Data',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsLight.backGround,
                      fontFamily: FontFamilyHelper.cairoArabic),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
