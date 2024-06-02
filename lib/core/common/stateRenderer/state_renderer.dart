import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

enum StateRenderType {
  //popup states (Dialog)
  popupLoadingState,
  popupErrorState,
  popupSuccessState,
  popupInternetConnectionState,
  popupLoadingAiState,
  popupMatchingAiState,
  popupNoMatchingAiState,

  //general
  contentState,
}

class StateRender extends StatelessWidget {
  const StateRender({
    required this.stateRenderType,
    required this.message,
    required this.retryActionFunction,
    super.key,
    this.title = '',
  });

  final StateRenderType stateRenderType;
  final Function retryActionFunction;
  final String message;
  final String title;

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRenderType) {
      case StateRenderType.popupLoadingState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.loadFullScreen),
        ]);

      case StateRenderType.popupInternetConnectionState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.noInternet),
          _getMessage(message),
          _getRetryButton(buttonTitle: LangKeys.ok, context: context),
        ]);

      case StateRenderType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.error),
          _getMessage(message),
          _getRetryButton(buttonTitle: LangKeys.ok, context: context),
        ]);

      case StateRenderType.contentState:
        return Container();

      case StateRenderType.popupSuccessState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.success),
        ]);

      case StateRenderType.popupLoadingAiState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.ai),
        ]);

      case StateRenderType.popupMatchingAiState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.success),
          _getMessage(message),
          _getRetryButton(buttonTitle: LangKeys.ok, context: context),
        ]);

      case StateRenderType.popupNoMatchingAiState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.noMatching),
          _getMessage(message),
          _getRetryButton(buttonTitle: LangKeys.ok, context: context),
        ]);
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.sp),
      ),
      elevation: 2,
      backgroundColor: ColorsLight.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsLight.mainColor,
          borderRadius: BorderRadius.circular(20.sp),
          boxShadow: const [BoxShadow(color: Colors.black26)],
        ),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Padding(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: 180.h,
      width: 280.w,
      child: Lottie.asset(
        animationName,
      ),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: FontFamilyHelper.cairoArabic,
            color: ColorsLight.lightBlack,
          ),
        ),
      ),
    );
  }

  Widget _getRetryButton({
    required String buttonTitle,
    required BuildContext context,
    double size = 12,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(size.sp),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Close the dialog for specific states
              if (stateRenderType == StateRenderType.popupErrorState ||
                  stateRenderType == StateRenderType.popupNoMatchingAiState ||
                  stateRenderType == StateRenderType.popupMatchingAiState ||
                  stateRenderType == StateRenderType.popupInternetConnectionState) {
                Navigator.of(context, rootNavigator: true).pop(true);
              } else {
                // Call retry function for other states
                retryActionFunction.call();
              }
            },
            child: Text(buttonTitle),
          ),
        ),
      ),
    );
  }
}
