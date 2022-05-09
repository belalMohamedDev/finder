import 'package:finder/presentation/resources/font_manger.dart';
import 'package:flutter/painting.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: FontConsistent.fontFamilyMontserrat);
}

//regular style

TextStyle getRegularStyle({
  required double fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManger.regular,
    color,
  );
}

//bold style
TextStyle getBoldStyle({
  required double fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManger.bold,
    color,
  );
}

//light style
TextStyle getLightStyle({
  required double fontSize,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManger.light, color);
}

// medium style
TextStyle getMediumStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.medium, color);
}

//semi bold style
TextStyle getSemiBoldStyle({
  required double fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManger.semiBold,
    color,
  );
}
