import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/feature/getFoundReportsScreen/data/model/foundResponse/found_response.dart';
import 'package:finder/feature/getFoundReportDetailsScreen/widgets/card_image_found_widget.dart';
import 'package:finder/feature/getFoundReportDetailsScreen/widgets/custom_found_information.dart';
import 'package:finder/feature/getFoundReportDetailsScreen/widgets/custom_user_found_it_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoundDetailsBody extends StatelessWidget {
  const FoundDetailsBody({
    super.key,
    required this.imageData,
    required this.data,
  });

  final String imageData;
  final GetFoundData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFadeInUp(
                duration: 1, child: CardImageFoundWidget(imageData: imageData)),
            SizedBox(
              height: 15.h,
            ),
            CustomFadeInUp(
                duration: 1, child: CustomFoundInformation(data: data)),
            SizedBox(
              height: 20.h,
            ),
            const CustomFadeInDown(
              duration: 1,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomFadeInDown(
                duration: 1, child: CustomUserFoundItInformation(data: data))
          ],
        ),
      ),
    );
  }
}
