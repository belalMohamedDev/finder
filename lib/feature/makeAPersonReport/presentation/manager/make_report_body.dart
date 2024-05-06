import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/feature/makeAPersonReport/presentation/manager/text_form_button_done.dart';
import 'package:finder/feature/makeAPersonReport/presentation/widgets/upload_missing_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MakeAReportPersonBody extends StatelessWidget {
  const MakeAReportPersonBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 60.h),
        child: Column(
          children: [
            const CustomFadeInUp(
              duration: 1,
              child: UploadMissingImageButton(),
            ),
            SizedBox(
              height: 50.h,
            ),
            const CustomFadeInDown(
              duration: 1,
              child: TextFormAndButtonAReport(),
            )
          ],
        ),
      ),
    );
  }
}
