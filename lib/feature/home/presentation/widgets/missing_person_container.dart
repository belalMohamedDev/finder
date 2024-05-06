import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:finder/feature/home/presentation/widgets/make_report_dialog.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MissingPersonContainer extends StatelessWidget {
  const MissingPersonContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
             showMakeReportDialog(context: context);
          },
          child: Container(
            color: Colors.transparent,
            height: 150.h,
            width: 150.w,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              elevation: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: ColorsLight.darkBlue,
                  padding: EdgeInsets.only(top: 42.h, left: 20.w, right: 20.w),
                  child: Image.asset(
                    ImageAsset.missing,
                    fit: BoxFit.contain,
                    color: ColorsLight.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          LangKeys.makeAReport,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 13.sp,
              ),
        ),
      ],
    );
  }
}
