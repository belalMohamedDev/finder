import 'dart:async';

import 'package:finder/presentation/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/models/on_boarding_model.dart';
import '../../resources/asset_manger.dart';
import '../../resources/constant_manger.dart';
import '../../resources/route_manger.dart';
import '../../resources/strings_manger.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //stream controller outputs

  final StreamController<SliderViewObject> _streamDataController = BehaviorSubject();

  final PageController _pageController = PageController();
  late final List<SliderObject> _list;
  bool isLast = false;
  bool isSecondPage = false;

  @override
  // onBoarding view model input
  void dispose() {
    _streamDataController.close();
  }

  @override
  void start() {
    //view model start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void goNext(context) {
    //button next page
    if (isLast == false) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: AppConstant.pageViewDelay),
          curve: Curves.fastLinearToSlowEaseIn);
    }else{
      onPageSkip(context);
    }
  }

  @override
  void goPrevious() {
    //Button previous in second page
    if (isSecondPage == true) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: AppConstant.pageViewDelay),
          curve: Curves.fastLinearToSlowEaseIn);
    }
  }

  @override
  void onPageSkip(context) {
    // skip button and navigate to login
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  @override
  void onPageChanged(index) {
    //on change page view
    if (index == _list.length - 1) {
      isLast = true;
      isSecondPage = false;
      _postDataToView();
    } else if (index == _list.length - 2) {
      isSecondPage = true;
      isLast = false;
      _postDataToView();
    } else {
      isLast = false;
      isSecondPage = false;
      _postDataToView();
    }
  }

  @override
  Sink get inputSliderViewObject => _streamDataController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamDataController.stream.map((sliderViewObject) => sliderViewObject);

  void _postDataToView() {
    // link between model and view
    inputSliderViewObject.add(
        SliderViewObject(
      list:_list ,
      pageController: _pageController,
        numberOfSlides: _list.length,
        isSecondPage: isSecondPage,
        isLast: isLast));
  }

  //on boarding private function
  //create object from model view
  List<SliderObject> _getSliderData() => [
        SliderObject(
            title: AppStrings.onBoardingTitle1,
            subTitle: AppStrings.onBoardingSubTitle1,
            image: ImageAsset.onBoardingFirstLogo),
        SliderObject(
            title: AppStrings.onBoardingTitle2,
            subTitle: AppStrings.empty,
            image: ImageAsset.onBoardingSecondLogo),
        SliderObject(
            title: AppStrings.onBoardingTitle3,
            subTitle: AppStrings.empty,
            image: ImageAsset.onBoardingThirdLogo),
      ];
}

//on boarding function input
abstract class OnBoardingViewModelInputs {
  void goNext(context); // when user clicks on right arrow or swipe left
  void goPrevious(); // when user click on left arrow or swipe right
  void onPageChanged(index); // when user click on left arrow or swipe right
  void onPageSkip(context); // when user click in skip
  //stream controller input
  Sink get inputSliderViewObject;
}

//on boarding function output
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
