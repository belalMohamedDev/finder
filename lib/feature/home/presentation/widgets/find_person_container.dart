import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindPersonContainer extends StatelessWidget {
  const FindPersonContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.aiView);
          },
          child: Container(
            color: Colors.transparent,
            height: 150.h,
            width: 150.w,
            child: Card(
              color: ColorsLight.darkBlue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              elevation: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: ColorsLight.white,
                  padding:  EdgeInsets.only(top: 12.h,left: 28.w,right: 25.w),
                  child: Image.asset(
                    ImageAsset.found,
                    color: ColorsLight.darkBlue,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height:30.h,
        ),
        Text(
         // 'Find Person',
          LangKeys.findingAPerson,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 13.sp, ),
        ),
      ],
    );
  }
}
