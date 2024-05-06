import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/feature/onBoarding/model/on_boarding_model.dart';
import 'package:finder/feature/onBoarding/presentation/viewModel/on_boarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextAndBackButton extends StatelessWidget {
  const NextAndBackButton(
      {required this.viewModel, super.key, this.sliderViewObject,});
  final SliderViewObject? sliderViewObject;
  final OnBoardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 100.h,
      ),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CustomFadeInUp(
              duration: 1,
              child: Container(
                height: sliderViewObject!.isSecondPage ? 48.h : 0.h,
                width: sliderViewObject!.isSecondPage ? 140.w : 0.w,
                decoration: BoxDecoration(
                  color: ColorsLight.white,
                  border: Border.all(
                    color: ColorsLight.lightBlue,
                    width: 0.5.w,
                  ),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: MaterialButton(
                  onPressed: viewModel.goPrevious,
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, size: 22.sp),
                      const Spacer(),
                      Text(
                        LangKeys.back,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: 16.sp,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: CustomFadeInUp(
              duration: 1,
              child: Container(
                height: sliderViewObject!.isLast ? 50.h : 50.h,
                width: sliderViewObject!.isLast ? 300.w : 140.w,
                decoration: BoxDecoration(
                  color: ColorsLight.lightBlue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15.sp),
                    topLeft: Radius.circular(15.sp),
                  ),
                ),
                child: MaterialButton(
                  onPressed: () => viewModel.goNext(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        sliderViewObject!.isLast
                            ? LangKeys.letsStart
                            : LangKeys.next,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      if (sliderViewObject!.isLast)
                        const SizedBox()
                      else
                        const Spacer(),
                      Icon(
                        sliderViewObject!.isLast ? null : Icons.arrow_forward,
                        color: ColorsLight.white,
                        size: 22.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
