import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/feature/onBoarding/model/on_boarding_model.dart';
import 'package:finder/feature/onBoarding/presentation/refactors/onBoarding_body.dart';
import 'package:finder/feature/onBoarding/presentation/viewModel/on_boarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({required this.viewModel, super.key, this.sliderViewObject});
  final SliderViewObject? sliderViewObject;
  final OnBoardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        actions: [
          CustomFadeInDown(
            duration: 1,
            child: TextButton(
              onPressed: () => viewModel.onPageSkip(context),
              child: Text(
                LangKeys.skip,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.sp),
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      body:OnBoardingBody(viewModel:viewModel ,sliderViewObject: sliderViewObject,),


    );
  }
}
