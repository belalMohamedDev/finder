import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyStateRender extends StatelessWidget {
  const EmptyStateRender({
    super.key,
    this.isScreenEmptySearch = false,
  });
  final bool isScreenEmptySearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            isScreenEmptySearch ? JsonAsset.emptySearch : JsonAsset.empty,
            height: 180.h,
            width: 250.w,
          ),
        ),
        isScreenEmptySearch
            ? const SizedBox.shrink()
            : Text(
                "Sorry, not found any data",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black38,
                    fontFamily: FontFamilyHelper.cairoArabic),
              )
      ],
    );
  }
}
