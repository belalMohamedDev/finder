//on boarding model
//on boarding page view model
import 'package:flutter/material.dart';

class SliderObject {
  String? title;
  String? subTitle;
  String? image;
  SliderObject({this.title, this.image, this.subTitle});
}

//on boarding data variables
class SliderViewObject {
  int? numberOfSlides;
  bool isLast;
  List<SliderObject> list;
  bool isSecondPage;
  PageController pageController;
  SliderViewObject(
      {this.numberOfSlides,
      required this.list,
      required this.isSecondPage,
      required this.isLast,
      required this.pageController});
}
