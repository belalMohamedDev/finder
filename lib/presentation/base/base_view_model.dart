

import 'dart:async';

import 'package:finder/presentation/common/stateRenderer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs  {
// shared variables and function that will be used through any view model.
final StreamController _inputStreamController=StreamController<FlowState>.broadcast();

@override

  Sink get inputState => _inputStreamController.sink;

@override

  Stream<FlowState> get outState => _inputStreamController.stream.map((flowState) => flowState);

@override
  void dispose() {
  _inputStreamController.close();
  }

}

abstract class BaseViewModelInputs {
  void start(); //start view model job
  void dispose();  //we called when view model dies
 Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState>get outState;
}
