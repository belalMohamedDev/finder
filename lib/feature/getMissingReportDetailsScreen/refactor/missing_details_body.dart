import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/feature/getMissingRepotsScreen/data/model/missingResponse/missing_response.dart';
import 'package:finder/feature/getMissingReportDetailsScreen/widgets/card_image_missing_widget.dart';
import 'package:finder/feature/getMissingReportDetailsScreen/widgets/custom_missing_information.dart';
import 'package:finder/feature/getMissingReportDetailsScreen/widgets/custom_user_phone_and_missing_describtion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MissingDetailsBody extends StatelessWidget {
  const MissingDetailsBody({
    super.key,
    required this.imageData,
    required this.data,
  });

  final String imageData;
  final GetMissingData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFadeInUp(child: CardImageMissingWidget(imageData: imageData)),
            SizedBox(
              height: 50.h,
            ),
            CustomFadeInUp(child: CustomMissingInformation(data: data)),
            SizedBox(
              height: 20.h,
            ),
            const CustomFadeInDown(
              child: Divider(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomFadeInDown(child: CustomUserPhoneAndMissingDescribtion(data: data))
          ],
        ),
      ),
    );
  }
}

