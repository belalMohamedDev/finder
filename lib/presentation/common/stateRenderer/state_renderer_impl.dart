import 'package:finder/application/constant.dart';
import 'package:finder/presentation/common/stateRenderer/state_renderer.dart';
import 'package:finder/presentation/resources/strings_manger.dart';
import 'package:flutter/material.dart';

abstract class FlowState {
  StateRenderType getStateRenderType();
  String getMessage();
}

//loading state (popUp ,full screen)

class LoadingState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  LoadingState(
      {required this.stateRenderType, this.message = AppStrings.loading});

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}


//success state (popUp )

class SuccessState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  SuccessState(
      {required this.stateRenderType, this.message = AppStrings.loading});

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}


//Internet Connection state (popUp ,full screen)

class InternetConnectionState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  InternetConnectionState({required this.stateRenderType, required this.message});

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}


//error state (popUp ,full screen)

class ErrorState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  ErrorState({required this.stateRenderType, required this.message});

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}

//content state
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constant.empty;

  @override
  StateRenderType getStateRenderType() => StateRenderType.contentState;
}

//empty state
class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => StateRenderType.fullScreenEmptyState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          dismissDialog(context);
          if (getStateRenderType() == StateRenderType.popupLoadingState) {
            //show popup loading
            showPopUp(context, getStateRenderType(), getMessage());
            // show content ui of screen
            return contentScreenWidget;
          } else {
            //full screen state loading state
            return StateRender(
              message: getMessage(),
              retryActionFunction: retryActionFunction,
              stateRenderType: getStateRenderType(),
            );
          }
        }

      case SuccessState:
        {
          dismissDialog(context);
          if (getStateRenderType() == StateRenderType.popupSuccessState) {
            //show popup loading
            showPopUp(context, getStateRenderType(), getMessage());
            // show content ui of screen
            return contentScreenWidget;
          } else {
            //full screen state loading state
            return StateRender(
              message: getMessage(),
              retryActionFunction: retryActionFunction,
              stateRenderType: getStateRenderType(),
            );
          }
        }

      case ErrorState:
        {
          dismissDialog(context);
          if (getStateRenderType() == StateRenderType.popupErrorState) {
            //show popup error
            showPopUp(context, getStateRenderType(), getMessage());
            // show content ui of screen
            return contentScreenWidget;
          } else {
            //full screen state error state
            return StateRender(
              message: getMessage(),
              retryActionFunction: retryActionFunction,
              stateRenderType: getStateRenderType(),
            );
          }
        }

      case InternetConnectionState:
        {
          dismissDialog(context);
          if (getStateRenderType() == StateRenderType.popupInternetConnectionState) {
            //show popup error
            showPopUp(context, getStateRenderType(), getMessage());
            // show content ui of screen
            return contentScreenWidget;
          } else {
            //full screen state error state
            return StateRender(
              message: getMessage(),
              retryActionFunction: retryActionFunction,
              stateRenderType: getStateRenderType(),
            );
          }
        }

      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }

      case EmptyState:
        {
          return StateRender(
              stateRenderType: getStateRenderType(),
              message: getMessage(),
              retryActionFunction: () {});
        }

      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;
  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  showPopUp(
      BuildContext context, StateRenderType stateRenderType, String message) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRender(
            stateRenderType: stateRenderType, retryActionFunction: () {}, message:message ,)));
  }
}
