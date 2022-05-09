import 'package:finder/application/app_prefs.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../application/di.dart';
import '../../../domain/models/on_boarding_model.dart';

import '../../resources/color_manger.dart';
import '../../resources/strings_manger.dart';
import '../../resources/values_manger.dart';
import '../viewModel/on_boarding_view_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  final AppPreferences _appPreferences=instance<AppPreferences>();
  _bind() {
    _appPreferences.setOnBoardingScreenView();
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data, _viewModel, context);
        });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

Widget _getContentWidget(SliderViewObject? sliderViewObject,
    OnBoardingViewModel _viewModel, context) {
  if (sliderViewObject == null) {
    return const SizedBox();
  } else {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () => _viewModel.onPageSkip(context),
              child: Text(
                AppStrings.skip,
                style: TextStyle(
                  fontSize: APPSize.s15.sp,
                ),
              )),
          SizedBox(
            width: AppPadding.p8.w,
          )
        ],
      ),
      body: SizedBox(

        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: AppPadding.p63.h,
              child: PageView.builder(
                  controller: sliderViewObject.pageController,
                  itemCount: sliderViewObject.numberOfSlides,
                  onPageChanged: (index) => _viewModel.onPageChanged(index),
                  itemBuilder: (context, index) {
                    return _OnBoardingPage(sliderViewObject.list[index]);
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: AppPadding.p12.h,
              ),
              child: SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    dotColor: ColorManger.grey,
                    activeDotColor: ColorManger.lightBlue,
                    dotHeight: AppPadding.p1_3.h,
                    spacing: AppPadding.p7.sp,
                    dotWidth: AppPadding.p4.w,
                    expansionFactor: APPSize.s4,
                  ),
                  controller: sliderViewObject.pageController,
                  count: sliderViewObject.list.length),
            ),
            _rowWidget(sliderViewObject, _viewModel, context),
          ],
        ),
      ),
    );
  }
}

Widget _rowWidget(SliderViewObject sliderViewObject,
    OnBoardingViewModel _viewModel, context) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: AppPadding.p4.h,
      left: AppPadding.p7.w,
      right: AppPadding.p7.w,
    ),
    child: Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: sliderViewObject.isSecondPage
                ? AppPadding.p6_3.h
                : AppPadding.p0.h,
            width: sliderViewObject.isSecondPage
                ? AppPadding.p38.w
                : AppPadding.p0.w,
            decoration: BoxDecoration(
                color: ColorManger.white,
                border: Border.all(
                    color: ColorManger.lightBlue, width: AppPadding.p0_5.w),
                borderRadius: BorderRadius.circular(APPSize.s8.sp)),
            child: MaterialButton(
                onPressed: () => _viewModel.goPrevious(),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, size: AppPadding.p22.sp),
                    const Spacer(),
                    Text(AppStrings.back,
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                )),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height:
                sliderViewObject.isLast ? AppPadding.p7.h : AppPadding.p6_3.h,
            width:
                sliderViewObject.isLast ? AppPadding.p85.w : AppPadding.p35.w,
            decoration: BoxDecoration(
                color: ColorManger.lightBlue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(APPSize.s15.sp),
                    topLeft: Radius.circular(APPSize.s15.sp))),
            child: MaterialButton(
                onPressed: () => _viewModel.goNext(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        sliderViewObject.isLast
                            ? AppStrings.letsStart
                            : AppStrings.next,
                        style: Theme.of(context).textTheme.headlineLarge),
                    sliderViewObject.isLast
                        ? const SizedBox(
                            width: null,
                            height: null,
                          )
                        : const Spacer(),
                    Icon(sliderViewObject.isLast ? null : Icons.arrow_forward,
                        color: ColorManger.white, size: AppPadding.p22.sp),
                  ],
                )),
          ),
        ),
      ],
    ),
  );
}

class _OnBoardingPage extends StatelessWidget {
  final SliderObject? _sliderObject;
  const _OnBoardingPage(
    this._sliderObject, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          "${_sliderObject?.image}",
          height: AppPadding.p41.h,
        ),
        SizedBox(
          height: AppPadding.p6.h,
        ),
        Text(
          "${_sliderObject?.title}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: AppPadding.p1.h,
        ),
        Text(
          "${_sliderObject?.subTitle}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
