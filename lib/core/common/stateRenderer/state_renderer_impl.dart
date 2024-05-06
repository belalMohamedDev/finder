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
    switch (runtimeType) {
      case const (LoadingAiState):
        {
          dismissDialog(context);
          if (getStateRenderType() == StateRenderType.popupLoadingAiState) {
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

      case const (AiMatchState):
        {
          dismissDialog(context);
          if (getStateRenderType() == StateRenderType.popupMatchingAiState) {
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

      case const (AiNotMatchState):
        {
          dismissDialog(context);
          if (getStateRenderType() == StateRenderType.popupNoMatchingAiState) {
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

      case const (SuccessState):
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

      case const (LoadingState):
        {
          dismissDialog(context);
          showPopUp(context, getStateRenderType(), getMessage());
          return contentScreenWidget;
        }

      case const (ErrorState):
        {
          dismissDialog(context);
          showPopUp(context, getStateRenderType(), getMessage());
          // show content ui of screen
          return contentScreenWidget;
        }

      case const (InternetConnectionState):
        {
          dismissDialog(context);
          //show popup error
          showPopUp(context, getStateRenderType(), getMessage());
          // show content ui of screen
          return contentScreenWidget;
        }

      case const (ContentState):
        {
          dismissDialog(context);
          return contentScreenWidget;
        }

      default:
        {
          dismissDialog(context);
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

  showPopUp(
      BuildContext context, StateRenderType stateRenderType, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRender(
              stateRenderType: stateRenderType,
              retryActionFunction: () {},
              message: message,
            )));
  }
}
