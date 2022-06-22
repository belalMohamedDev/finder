import 'package:finder/presentation/resources/asset_manger.dart';
import 'package:finder/presentation/resources/font_manger.dart';
import 'package:finder/presentation/resources/strings_manger.dart';
import 'package:finder/presentation/resources/styles_manger.dart';
import 'package:finder/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../resources/color_manger.dart';

enum StateRenderType {
  //popup states (Dialog)
  popupLoadingState,
  popupErrorState,
  popupSuccessState,
  popupInternetConnectionState,
  popupLoadingAiState,
  popupMatchingAiState,
  popupNoMatchingAiState,
  //FULL SCREEN STATED (FULL SCREEN)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,
  fullScreenInternetConnectionState,

  //general
  contentState,
}

class StateRender extends StatelessWidget {
  final StateRenderType stateRenderType;
  final String message;
  final String title;
  final Function retryActionFunction;

  const StateRender({
    Key? key,
    required this.stateRenderType,
    required this.message,
    required this.retryActionFunction,
    this.title = "",
  }) : super(key: key);

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

      case StateRenderType.popupLoadingAiState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.ai),
        ]);

      case StateRenderType.popupSuccessState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.success),
        ]);

      case StateRenderType.popupInternetConnectionState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.noInternet),
          _getMessage(message),
          _getRetryButton(buttonTitle: AppStrings.ok, context: context),
        ]);

      case StateRenderType.popupMatchingAiState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.success),
          _getMessage(message),
          _getRetryButton(buttonTitle: AppStrings.ok, context: context),
        ]);

      case StateRenderType.popupNoMatchingAiState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.noMatching),
          _getMessage(message),
          _getRetryButton(buttonTitle: AppStrings.ok, context: context),
        ]);

      case StateRenderType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAsset.error),
          _getMessage(message),
          _getRetryButton(buttonTitle: AppStrings.ok, context: context),
        ]);

      case StateRenderType.fullScreenLoadingState:
        return _getItemColumn([
          _getAnimatedImage(JsonAsset.boyError),
          _getMessage(message),
        ]);

      case StateRenderType.fullScreenInternetConnectionState:
        return _getItemColumn([
          _getAnimatedImage(JsonAsset.noInternet),
          _getMessage(message),
          _getRetryButton(
              buttonTitle: AppStrings.retryAgain,
              context: context,
              size: AppPadding.p12),
        ]);

      case StateRenderType.fullScreenErrorState:
        return _getItemColumn([
          _getAnimatedImage(JsonAsset.error),
          _getMessage(message),
          _getRetryButton(
              buttonTitle: AppStrings.retryAgain,
              context: context,
              size: AppPadding.p12),
        ]);

      case StateRenderType.fullScreenEmptyState:
        return _getItemColumn([
          _getAnimatedImage(JsonAsset.empty),
          _getMessage(message),
          _getRetryButton(
              buttonTitle: AppStrings.retryAgain,
              context: context,
              size: AppPadding.p22),
        ]);
      case StateRenderType.contentState:
        return Container();

      default:
        return Container();
    }
  }

  Widget _getItemColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(APPSize.s9.sp),
      ),
      elevation: APPSize.s2,
      backgroundColor: ColorManger.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManger.backGround,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(APPSize.s14),
          boxShadow: const [BoxShadow(color: Colors.black26)],
        ),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: APPSize.s28.h,
      width: APPSize.s100.w,
      child: Lottie.asset(
        animationName,
      ),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(message,
            style: getMediumStyle(
                fontSize: FontSize.s12.sp, color: ColorManger.lightBlack)),
      ),
    );
  }

  Widget _getRetryButton(
      {required String buttonTitle,
      required BuildContext context,
      double size = AppPadding.p12}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(size.sp),
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (stateRenderType == StateRenderType.popupErrorState ||
                      stateRenderType ==
                          StateRenderType.popupInternetConnectionState ||
                      stateRenderType == StateRenderType.popupNoMatchingAiState ||
                      stateRenderType == StateRenderType.popupMatchingAiState) {
                    // popup error state
                    Navigator.of(context).pop();
                  } else {
                    //call retry function
                    retryActionFunction.call();
                  }
                },
                child: Text(buttonTitle))),
      ),
    );
  }
}
