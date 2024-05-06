import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/language/lang_keys.dart';

import 'package:finder/feature/makeUnReport/presentation/widgets/text_form_button_done.dart';
import 'package:finder/feature/makeUnReport/presentation/widgets/upload_found_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MakeUnReportBody extends StatelessWidget {
  const MakeUnReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 120.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomFadeInUp(duration: 1, child: UploadFindImageButton()),
            SizedBox(
              height: 40.h,
            ),
            CustomFadeInRight(
              duration: 1,
              child: Text(
                LangKeys.putImageDetails,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 15.sp, color: Colors.black45),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            const CustomFadeInDown(
                duration: 1, child: TextFormAndButtonUnReport()),
          ],
        ),
      ),
    );
  }
}
