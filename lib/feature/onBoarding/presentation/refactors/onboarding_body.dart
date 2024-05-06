import 'package:finder/feature/onBoarding/model/on_boarding_model.dart';
import 'package:finder/feature/onBoarding/presentation/viewModel/on_boarding_view_model.dart';
import 'package:finder/feature/onBoarding/presentation/widgets/next_back_button_widget.dart';
import 'package:finder/feature/onBoarding/presentation/widgets/page_indicator_widget.dart';
import 'package:finder/feature/onBoarding/presentation/widgets/page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody(
      {required this.viewModel, super.key, this.sliderViewObject,});
  final SliderViewObject? sliderViewObject;
  final OnBoardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (sliderViewObject == null) {
      return const SizedBox();
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
        child: Column(
          children: [
            PageViewWidget(
              viewModel: viewModel,
              sliderViewObject: sliderViewObject,
            ),
            PageIndicatorWidget(sliderViewObject: sliderViewObject),
            NextAndBackButton(
              viewModel: viewModel,
              sliderViewObject: sliderViewObject,
            ),
          ],
        ),
      );
    }
  }
}
