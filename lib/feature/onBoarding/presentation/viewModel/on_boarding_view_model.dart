import 'dart:async';



import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/services/shared_pref/pref_keys.dart';
import 'package:finder/core/services/shared_pref/shared_pref.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:finder/feature/base/base_view_model.dart';
import 'package:finder/feature/onBoarding/model/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
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
  void goNext(BuildContext context) {
    //button next page
    if (isLast == false) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 750),
          curve: Curves.fastLinearToSlowEaseIn,);
    }else{
      onPageSkip(context);
    }
  }

  @override
  void goPrevious() {
    //Button previous in second page
    if (isSecondPage == true) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 750),
          curve: Curves.fastLinearToSlowEaseIn,);
    }
  }

  @override
  void onPageSkip(BuildContext context) {
    // skip button and navigate to login
    SharedPref().setBoolean(PrefKeys.onBoardingScreen,true);

    context.pushReplacementNamed( Routes.loginRoute);
  }

  @override
  void onPageChanged(int index) {
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
  Sink<dynamic> get inputSliderViewObject => _streamDataController.sink;

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
        isLast: isLast,),);
  }

  //on boarding private function
  //create object from model view
  List<SliderObject> _getSliderData() => [
        SliderObject(
            title: LangKeys.onBoardingTitle1,
            subTitle: LangKeys.onBoardingSubTitle1,
            image: ImageAsset.onBoardingFirstLogo,),
        SliderObject(
            title: LangKeys.onBoardingTitle2,
            subTitle: LangKeys.empty,
            image: ImageAsset.onBoardingSecondLogo,),
        SliderObject(
            title: LangKeys.onBoardingTitle3,
            subTitle: LangKeys.empty,
            image: ImageAsset.onBoardingThirdLogo,),
      ];

}

//on boarding function input
abstract class OnBoardingViewModelInputs {
  void goNext(BuildContext context); // when user clicks on right arrow or swipe left
  void goPrevious(); // when user click on left arrow or swipe right
  void onPageChanged(int index); // when user click on left arrow or swipe right
  void onPageSkip(BuildContext context); // when user click in skip
  //stream controller input
  Sink<dynamic> get inputSliderViewObject;
}

//on boarding function output
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
