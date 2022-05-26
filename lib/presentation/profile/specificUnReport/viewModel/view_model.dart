import 'dart:async';
import 'dart:ffi';



import 'package:finder/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../domain/models/makeUnSpecificReport/model.dart';
import '../../../../domain/useCase/makeUnSpecificReport/use_case.dart';
import '../../../common/stateRenderer/state_renderer.dart';
import '../../../common/stateRenderer/state_renderer_impl.dart';



class SpecificUnReportViewModel extends BaseViewModel
    with SpecificUnReportViewModelInput, SpecificUnReportViewModelOutput {
  final StreamController _dataStreamController = BehaviorSubject<MakeSpecificUnReportModel>();
  final SpecificUnReportUseCase _specificUnReportUseCase;
  SpecificUnReportViewModel(this._specificUnReportUseCase);


  // --input
  @override
  void start() {
    // load data from api
    _getMissingData();
  }

  _getMissingData() async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.fullScreenLoadingState, message: ''));

    (await _specificUnReportUseCase.execute(Void)).fold(
            (failure) => {
          // left -> failure
          if(failure.code==404){
            inputState.add(ErrorState(
              stateRenderType: StateRenderType.fullScreenEmptyState,
              message:"Not Found Data",
            )),



          } else{

            inputState.add(ErrorState(
              stateRenderType: StateRenderType.fullScreenErrorState,
              message: failure.message,
            )),

          }



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
  Stream<List<MakeSpecificUnReportModel>> get outputData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class SpecificUnReportViewModelInput {
  Sink get inputData;
}

abstract class SpecificUnReportViewModelOutput {
  Stream<List<MakeSpecificUnReportModel>> get outputData;
}
