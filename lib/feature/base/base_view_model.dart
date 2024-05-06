import 'dart:async';

import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel
    implements BaseViewModelInputs, BaseViewModelOutputs {
// shared variables and function that will be used through any view model.
  final _inputStreamController = BehaviorSubject<FlowState>();

  @override
  Sink<FlowState> get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outState =>
      _inputStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start(); //start view model job
  void dispose(); //we called when view model dies
  Sink<FlowState> get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outState;
}
