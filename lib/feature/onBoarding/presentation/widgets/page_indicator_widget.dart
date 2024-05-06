import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/feature/onBoarding/model/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({super.key, this.sliderViewObject});
  final SliderViewObject? sliderViewObject;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CustomFadeInUp(
        duration: 1,
        child: SmoothPageIndicator(
          effect: ExpandingDotsEffect(
            dotColor: ColorsLight.grey,
            activeDotColor: ColorsLight.lightBlue,
            dotHeight: 8.h,
            spacing: 7.sp,
            dotWidth: 15.w,
            expansionFactor: 4,
          ),
          controller: sliderViewObject!.pageController,
          count: sliderViewObject!.list.length,),
      ),
    );
  }
}
