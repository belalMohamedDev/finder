import 'dart:async';
import 'dart:ffi';


import 'package:finder/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/models/unReport/un_report_model.dart';
import '../../../domain/useCase/unReport/un_report_use_case.dart';
import '../../common/stateRenderer/state_renderer.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';

class FoundViewModel extends BaseViewModel
    with FoundViewModelInput, FoundViewModelOutput {
  final StreamController _dataStreamController =
      BehaviorSubject<List<DataModel>>();
  final UnReportUseCase _unReportUseCase;
  FoundViewModel(this._unReportUseCase);


  // --input
  @override
  void start() {
    // load data from api
    _getFoundData();
  }

  _getFoundData() async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.fullScreenLoadingState, message: ''));

    (await _unReportUseCase.execute(Void)).fold(
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

abstract class FoundViewModelInput {
  Sink get inputData;
}

abstract class FoundViewModelOutput {
  Stream<List<DataModel>> get outputData;
}
