import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/feature/onBoarding/model/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PageViewSliderObject extends StatelessWidget {
  const PageViewSliderObject(
      this._sliderObject, {
        super.key,
      });
  final SliderObject? _sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFadeInLeft(
          duration: 1,
          child: SvgPicture.asset(
            '${_sliderObject?.image}',
          ),
        ),
        SizedBox(
          height: 60.h,
        ),
        CustomFadeInRight(
          duration: 1,
          child: Text(
            '${_sliderObject?.title}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomFadeInLeft(
          duration: 1,
          child: Text(
            '${_sliderObject?.subTitle}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 15.sp,),
          ),
        ),
      ],
    );
  }
}
