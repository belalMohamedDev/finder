import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showMakeReportDialog({
  required BuildContext context,
}) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => const AlertDialog(
      backgroundColor:
          Colors.black54, // Make AlertDialog background transparent
      content: ShowMakeReportDialogContent(),
    ),
  );
}

class ShowMakeReportDialogContent extends StatelessWidget {
  const ShowMakeReportDialogContent({
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
          const CustomFadeInUp(
            duration: 1,
            child: ShowMakeReportDialogButton(),
          ),
        ],
      ),
    );
  }
}

class ShowMakeReportDialogButton extends StatelessWidget {
  const ShowMakeReportDialogButton({
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
              Navigator.pushNamed(context, Routes.makeReport);
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
                  'Report a missing person',
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
              Navigator.pushNamed(context, Routes.makeObjectReport);
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
                  'Report something missing',
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
