
import 'package:finder/feature/onBoarding/model/on_boarding_model.dart';
import 'package:finder/feature/onBoarding/presentation/refactors/slider_object.dart';
import 'package:finder/feature/onBoarding/presentation/viewModel/on_boarding_view_model.dart';
import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({required this.viewModel, super.key, this.sliderViewObject});
  final SliderViewObject? sliderViewObject;
  final OnBoardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 15,
      child: PageView.builder(
        controller: sliderViewObject?.pageController,
        itemCount: sliderViewObject?.numberOfSlides,
        onPageChanged: viewModel.onPageChanged,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: PageViewSliderObject(sliderViewObject?.list[index]),);
        },
      ),
    );
  }
}
