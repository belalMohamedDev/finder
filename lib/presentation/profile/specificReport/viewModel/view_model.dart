import 'dart:async';
import 'dart:ffi';

import 'package:finder/domain/models/makeSpecificReport/model.dart';

import 'package:finder/domain/useCase/specificReport/use_case.dart';
import 'package:finder/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../common/stateRenderer/state_renderer.dart';
import '../../../common/stateRenderer/state_renderer_impl.dart';



class SpecificReportViewModel extends BaseViewModel
    with SpecificReportViewModelInput, SpecificReportViewModelOutput {
  final StreamController _dataStreamController = BehaviorSubject<DataMakeSpecificReportModel>();
  final SpecificReportUseCase _specificReportUseCase;
  SpecificReportViewModel(this._specificReportUseCase);


  // --input
  @override
  void start() {
    // load data from api
    _getMissingData();
  }

  _getMissingData() async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.fullScreenLoadingState, message: ''));

    (await _specificReportUseCase.execute(Void)).fold(
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
  Stream<List<MakeSpecificReportModel>> get outputData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class SpecificReportViewModelInput {
  Sink get inputData;
}

abstract class SpecificReportViewModelOutput {
  Stream<List<MakeSpecificReportModel>> get outputData;
}
