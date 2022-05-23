import 'dart:async';
import 'dart:ffi';

import 'package:finder/domain/models/reports/reports_model.dart';
import 'package:finder/domain/useCase/reports/reports_use_case.dart';
import 'package:finder/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/stateRenderer/state_renderer.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';

class MissingViewModel extends BaseViewModel
    with MissingViewModelInput, MissingViewModelOutput {
  final StreamController _dataStreamController =
  BehaviorSubject<List<DataModel>>();
  final ReportUseCase _reportUseCase;
  MissingViewModel(this._reportUseCase);


  // --input
  @override
  void start() {
    // load data from api
    _getMissingData();
  }

  _getMissingData() async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.fullScreenLoadingState, message: ''));

    (await _reportUseCase.execute(Void)).fold(
            (failure) => {
          // left -> failure
          inputState.add(ErrorState(
            stateRenderType: StateRenderType.fullScreenErrorState,
            message: failure.message,
          )),
        }, (dataFound) {
      //right -> data(success)

      //content
      inputState.add(ContentState());
      //navigate to main screen
      inputData.add(dataFound.data);
    });
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputData => _dataStreamController.sink;

  // -- output
  @override
  Stream<List<DataModel>> get outputData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class MissingViewModelInput {
  Sink get inputData;
}

abstract class MissingViewModelOutput {
  Stream<List<DataModel>> get outputData;
}
