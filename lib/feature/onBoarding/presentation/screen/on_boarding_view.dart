
import 'package:finder/feature/onBoarding/model/on_boarding_model.dart';

import 'package:finder/feature/onBoarding/presentation/refactors/onboarding_content.dart';
import 'package:finder/feature/onBoarding/presentation/viewModel/on_boarding_view_model.dart';

import 'package:flutter/material.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();



  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return OnBoardingContent(sliderViewObject: snapshot.data, viewModel: _viewModel);
      },
    );
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
