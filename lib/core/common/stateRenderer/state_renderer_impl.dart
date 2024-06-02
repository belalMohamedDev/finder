import 'package:finder/core/common/stateRenderer/state_renderer.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:flutter/material.dart';

abstract class FlowState {
  StateRenderType getStateRenderType();
  String getMessage();
}

//loading state (popUp ,full screen)
class LoadingState extends FlowState {
  LoadingState({
    required this.stateRenderType,
    this.message = LangKeys.loading,
  });
  StateRenderType stateRenderType;
  String message;

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}

//Internet Connection state (popUp ,full screen)
class InternetConnectionState extends FlowState {
  InternetConnectionState({
    required this.stateRenderType,
    required this.message,
  });
  StateRenderType stateRenderType;
  String message;

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}

//error state (popUp ,full screen)
class ErrorState extends FlowState {
  ErrorState({required this.stateRenderType, required this.message});
  StateRenderType stateRenderType;
  String message;

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}

//content state
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => '';

  @override
  StateRenderType getStateRenderType() => StateRenderType.contentState;
}

//loading state (popUp ,full screen)

//loading Ai state (popUp)
class LoadingAiState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  LoadingAiState(
      {required this.stateRenderType, this.message = LangKeys.loading});

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}

//Ai Match state (popUp )
class AiMatchState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  AiMatchState({required this.stateRenderType, required this.message});

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}

//Ai Not Match state (popUp )
class AiNotMatchState extends FlowState {
  StateRenderType stateRenderType;
  String message;
  AiNotMatchState({required this.stateRenderType, required this.message});

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
      {required this.stateRenderType, this.message = LangKeys.loading});

  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRenderType() => stateRenderType;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
      {required BuildContext context,
      Widget contentScreenWidget = const SizedBox.shrink(),
      required Function retryActionFunction}) {
    // Dismiss any existing dialogs before showing a new one
    dismissDialog(context);

    switch (runtimeType) {
      case const (LoadingAiState) :
        {
          if (getStateRenderType() == StateRenderType.popupLoadingAiState) {
            showPopUp(context, getStateRenderType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRender(
              message: getMessage(),
              retryActionFunction: retryActionFunction,
              stateRenderType: getStateRenderType(),
            );
          }
        }

      case const (AiMatchState):
        {
          if (getStateRenderType() == StateRenderType.popupMatchingAiState) {
            showPopUp(context, getStateRenderType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRender(
              message: getMessage(),
              retryActionFunction: retryActionFunction,
              stateRenderType: getStateRenderType(),
            );
          }
        }

      case const (AiNotMatchState):
        {
          if (getStateRenderType() == StateRenderType.popupNoMatchingAiState) {
            showPopUp(context, getStateRenderType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRender(
              message: getMessage(),
              retryActionFunction: retryActionFunction,
              stateRenderType: getStateRenderType(),
            );
          }
        }

      case const (SuccessState):
        {
          if (getStateRenderType() == StateRenderType.popupSuccessState) {
            showPopUp(context, getStateRenderType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRender(
              message: getMessage(),
              retryActionFunction: retryActionFunction,
              stateRenderType: getStateRenderType(),
            );
          }
        }

      case const (LoadingState):
        {
          showPopUp(context, getStateRenderType(), getMessage());
          return contentScreenWidget;
        }

      case const (ErrorState):
        {
          showPopUp(context, getStateRenderType(), getMessage());
          return contentScreenWidget;
        }

      case const (InternetConnectionState):
        {
          showPopUp(context, getStateRenderType(), getMessage());
          return contentScreenWidget;
        }

      case const (ContentState):
        {
          return contentScreenWidget;
        }

      default:
        {
          return contentScreenWidget;
        }
    }
  }

  bool _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  void dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  void showPopUp(BuildContext context, StateRenderType stateRenderType, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isCurrentDialogShowing(context)) {
        showDialog(
          context: context,
          builder: (BuildContext context) => StateRender(
            stateRenderType: stateRenderType,
            retryActionFunction: () {},
            message: message,
          ),
        );
      }
    });
  }
}
